const fs=require('fs'),path=require('path'),vm=require('vm'),assert=require('assert/strict'),crypto=require('crypto');
const root=__dirname,web=path.resolve(root,'../games/365days-eclair'),stage=path.join(root,'stage');
const assets=JSON.parse(fs.readFileSync(path.join(root,'assets.json'),'utf8')),assetSources=new Map(assets.map(a=>[a.relative,a.source]));
const read=n=>fs.readFileSync(fs.existsSync(path.join(stage,'data/scenario',n))?path.join(stage,'data/scenario',n):path.join(web,'data/scenario',n),'utf8').replace(/\r\n/g,'\n');
const section=(t,label)=>{const start=t.indexOf('\n*'+label+'\n');assert.ok(start>=0,label);const end=t.indexOf('\n*',start+2);return t.slice(start,end<0?undefined:end);};
const attrs=t=>Object.fromEntries([...t.matchAll(/(\w+)="([^"]*)"/g)].map(m=>[m[1],m[2]]));
const files=['n04_april.ks','n05_may.ks','n06_june.ks','n07_july.ks','n08_august.ks','n09_september.ks','n10_october.ks','n11_november.ks','n12_december.ks','n01_january.ks','n02_february.ks','n03_march.ks','op_movie.ks','system_common.ks','title_screen.ks','config.ks','system/future_character_define.ks','system/message_window.ks'];
let jsChecks=0,references=0;const log=[];
for(const name of files){
 const text=read(name),labels=[...text.matchAll(/^\*([^\s|]+)(?:\|.*)?\s*$/gm)].map(m=>m[1]);
 assert.equal(labels.length,new Set(labels).size,name+' duplicate label');
 for(const m of text.matchAll(/\[iscript[^\]]*\]([\s\S]*?)\[endscript\]/g)){new vm.Script(m[1]);jsChecks++;}
 const tags=text.replace(/\[iscript[^\]]*\][\s\S]*?\[endscript\]/g,'');let depth=0;
 for(const m of tags.matchAll(/^\[(if|elsif|else|endif)(?:\s[^\n]*)?\]/gm)){
  if(m[1]==='if')depth++;else{assert.ok(depth>0,name+' unmatched '+m[1]);if(m[1]==='endif')depth--;}
 }
 assert.equal(depth,0,name+' unclosed if');
 for(const m of tags.matchAll(/\[(?:eval|if|elsif|emb)\s+exp="([^"]*)"/g)){new vm.Script(m[1]);jsChecks++;}
 for(const m of tags.matchAll(/^\[([^\s\]]+)([^\n]*)\]/gm)){
  const tag=m[1],a=attrs(m[2]),s=a.storage;
  if(['jump','call','glink','button'].includes(tag)&&a.target?.startsWith('*')&&!a.target.includes('%')){
   const target=s?.endsWith('.ks')?s:name;
   assert.ok(read(target).split('\n').some(l=>l.trim().split('|')[0]===a.target),name+' missing '+target+' '+a.target);
  }
  if(!s||/^[&%]/.test(s)||/^https?:/.test(s))continue;
  if(tag==='preload'&&s.startsWith('./data/')){const rel=s.slice(2);assert.ok(fs.existsSync(path.join(web,rel))||assetSources.has(rel),name+' missing preload '+rel);references++;continue;}
  const folder=s.endsWith('.ks')?'scenario':tag==='bg'?'bgimage':['chara_new','chara_face','chara_mod','chara_show'].includes(tag)?'fgimage':['xchgbgm','playbgm','fadeinbgm'].includes(tag)?'bgm':['playse','fadeinse'].includes(tag)?'sound':['movie','march_movie'].includes(tag)?'video':tag==='loadjs'?'others':['image','button'].includes(tag)?(a.folder||'image'):null;
  if(folder){const rel='data/'+folder+'/'+s;assert.ok(fs.existsSync(path.join(web,rel))||fs.existsSync(path.join(stage,rel))||assetSources.has(rel),name+' missing '+rel);references++;}
 }
}
const runtime=fs.readFileSync(path.join(stage,'data/others/march_ending.js'),'utf8');new vm.Script(runtime);jsChecks++;
log.push(`Static PASS: ${files.length} scenarios, ${jsChecks} JavaScript checks, ${references} references.`);
const parserContext={tyrano:{plugin:{kag:{}}},$:{trim:s=>String(s).trim(),replaceAll:(s,a,b)=>s.split(a).join(b)}};
vm.runInNewContext(fs.readFileSync(path.join(web,'tyrano/plugins/kag/kag.parser.js'),'utf8'),parserContext);
const parser=parserContext.tyrano.plugin.kag.parser,warnings=[];
parser.kag={config:{KeepSpaceInParameterValue:'3'},stat:{current_scenario:''},warning:(...v)=>warnings.push(v),error:(...v)=>{throw Error(v.join(' '));},convertLang(){}};
for(const file of files){parser.kag.stat.current_scenario=file;const result=parser.parseScenario(read(file));assert.ok(result.array_s.length>0);}
assert.equal(warnings.length,0,JSON.stringify(warnings));
log.push('Bundled TyranoScript parser PASS: all 18 scenarios, no syntax warnings or unmatched if/endif.');
for(const a of assets){const b=fs.readFileSync(a.source);assert.equal(crypto.createHash('sha256').update(b).digest('hex'),a.sha256);}
assert.equal(assets.length,18);assert.ok(!assets.some(a=>a.source.includes('reference_only')));
const march=read('n03_march.ks'),common=read('system_common.ks'),april=read('n04_april.ks');
assert.ok(!march.includes('LEARNED')&&!march.includes('chara_show name="主人公"'));
const timeline=JSON.parse(fs.readFileSync(path.join(root,'true-timeline.json'),'utf8'));
assert.equal(timeline.length,84);assert.equal(timeline.at(-1).until_seconds,251);
for(let i=1;i<timeline.length;i++)assert.ok(timeline[i].until_seconds>timeline[i-1].until_seconds);
const trueSection=section(march,'true_end_entry');assert.ok(!trueSection.includes('[p]')&&!trueSection.includes('[s]'));
assert.equal((trueSection.match(/\[march_true_begin\]/g)||[]).length,1);
assert.ok(trueSection.indexOf('[march_true_begin]')<trueSection.indexOf('「……抹茶ちゃんが決めればいい」'));
assert.ok(trueSection.includes('[march_true_wait at="260.000" minimum="6500"]'));
assert.equal((trueSection.match(/MarchEnding.playerName\(f.player_name\)/g)||[]).length,2);
assert.ok(trueSection.includes('CG15_07')&&trueSection.includes('CG15_08'));
for(const t of ['staff','366日目のレシピ.mp3','march_first_ending.mp4'])assert.ok(!trueSection.includes(t));
assert.ok(section(march,'scene_03_10').includes('sf.true_bad_seen === true && f.march_retry_run === true'));
assert.ok(!section(march,'scene_03_11a').includes('sf.true_bad_seen = true'));
assert.ok(!section(march,'scene_03_12a').includes('sf.true_bad_seen = true'));
const card=section(march,'march_ending_menu');assert.ok(card.indexOf('sf.true_bad_seen = true')>card.indexOf('真・BAD END 017『約束どおり』'));
assert.ok(card.includes("f.scene == '03_12a'"),'Do not undo debug reset by revisiting records');
assert.equal((march.match(/sf\.cg_march_/g)||[]).length,10);
for(const m of march.matchAll(/^\[bg storage="cg\/march\//gm))assert.ok(march.slice(0,m.index).slice(-1900).includes('[skipstop]'));
for(const label of ['scene_03_12a','march_ending_menu'])assert.ok(!section(march,label).includes('xchgbgm'));
for(const label of ['normal_end_01','normal_end_02']){assert.ok(!section(march,label).includes('march_true_'));assert.ok(!section(march,label).includes('register_core_bad'));}
for(const label of ['review_03_a','review_03_b']){assert.ok(section(march,label).includes('*choice_03_01'));assert.ok(!section(march,label).includes('register_'));}
assert.ok(section(march,'scene_03_07').indexOf('「じゃあ、本気で勝ちにいくわ」')<section(march,'scene_03_07').indexOf('15_The_Real_Patissier.mp3'));
assert.ok(section(april,'april_march_insight').includes('*choice_04_c'));
const aprBefore=fs.readFileSync(path.join(root,'baseline/live/data/scenario/n04_april.ks'),'utf8').replace(/\r\n/g,'\n');
assert.ok(april.includes(aprBefore.slice(aprBefore.indexOf('[glink target="*choice_04_a"'),aprBefore.indexOf('[s]',aprBefore.indexOf('[glink target="*choice_04_a"'))+3)));
log.push('557 March spoken lines retained by generator; 84 timed TRUE pages + final narration; 16 April INSIGHT lines, ten CG triggers, actual-ended movie, first/second ending gates, normal-END distinction PASS.');
const recordScript=[...common.matchAll(/\[iscript[^\]]*\]([\s\S]*?)\[endscript\]/g)].map(m=>m[1]).find(s=>s.includes('var archiveMonths ='));
const records=JSON.parse(fs.readFileSync(path.join(root,'records.json'),'utf8')),cgs=JSON.parse(fs.readFileSync(path.join(root,'cgs.json'),'utf8'));
function data(script,month,tab,key,sf={}){
 const f={april_record_month:month,april_record_tab:tab,april_record_selected:key,april_record_cg_category:key.startsWith('mini_')?'MINI':'EVENT'};vm.runInNewContext(script,{sf,f});return f;
}
for(const [key,rec] of Object.entries(records)){
 const tab=key.startsWith('mini_')?'MINI':'CORE',locked=data(recordScript,'03',tab,key);
 assert.equal(locked.april_record_locked,true);assert.equal(locked.april_record_detail_title,'？？？');
 for(const field of ['meta','condition1','condition2','body1','body2','body3','body4','body5','body6','body7','body8','comment','comment2','note'])assert.equal(locked['april_record_detail_'+field],'',key+' locked '+field);
 const open=data(recordScript,'03',tab,key,{[rec.flag]:true});assert.equal(open.april_record_locked,false);assert.equal(open.april_record_detail_title,rec.title);
 assert.equal(Array.from({length:8},(_,n)=>open['april_record_detail_body'+(n+1)]).join(''),rec.raw_body);
 assert.equal(open.april_record_detail_comment+open.april_record_detail_comment2,rec.raw_comment);
}
for(const [key,cg] of Object.entries(cgs)){
 const locked=data(recordScript,'03','CG',key);assert.equal(locked.april_record_cg_unlocked,false);assert.equal(locked.april_record_detail_comment,'');
 const open=data(recordScript,'03','CG',key,{[cg.flag]:true});assert.equal(open.april_record_cg_unlocked,true);assert.equal(open.april_record_cg_file,cg.file);assert.equal(open.april_record_detail_comment,cg.caption);
}
const oldCommon=fs.readFileSync(path.join(root,'baseline/live/data/scenario/system_common.ks'),'utf8'),oldScript=[...oldCommon.matchAll(/\[iscript[^\]]*\]([\s\S]*?)\[endscript\]/g)].map(m=>m[1]).find(s=>s.includes('var archiveMonths ='));
const knownFlags=Object.fromEntries([...common.matchAll(/(?:core_bad_\d{3}|mini_bad_m\d{2}|normal_ch\d{2}_clear|cg_(?:april|may|june|july|august|september|october|november|december|january|february|march)_(?:event|mini)_\d{2})/g)].map(m=>[m[0],true]));
let regressions=0;
for(const [month,core,clear,mini] of [['04','001','clear','mini_m01'],['05','003','may_clear','may_mini_none'],['06','005','june_clear','june_mini_none'],['07','007','july_clear','july_mini_none'],['08','008','august_clear','august_mini_none'],['09','009','september_clear','september_mini_none'],['10','010','october_clear','october_mini_none'],['11','012','november_clear','mini_m04'],['12','014','december_clear','mini_m06'],['01','015','january_clear','mini_m08'],['02','016','february_clear','mini_m10']]){
 for(const [tab,key] of [['CORE','core_'+core],['CORE',clear],['MINI',mini],['CG','event_01'],['CG','event_02'],['CG','event_03'],['CG','mini_01'],['CG','mini_02']])for(const sf of [{},knownFlags]){
  const before=data(oldScript,month,tab,key,sf),after=data(recordScript,month,tab,key,sf);for(const [field,value] of Object.entries(before))assert.equal(after[field],value,month+' '+key+' '+field);regressions++;
 }
}
const resetScript=label=>section(common,label).match(/\[iscript\]([\s\S]*?)\[endscript\]/)[1];
const flags=Object.values(records).map(r=>r.flag).concat(Object.values(cgs).map(c=>c.flag));assert.equal(flags.length,17);
const sf={...Object.fromEntries(flags.map(k=>[k,true])),core_bad_015:true,normal_ch02_clear:true,cg_february_event_01:true,true_bad_seen:true,cg_view:{keep:true}};
vm.runInNewContext(resetScript('records_reset_month_apply'),{sf,f:{april_record_month:'03'}});for(const key of flags)assert.equal(sf[key],false);assert.equal(sf.normal_ch02_clear,true);assert.equal(sf.true_bad_seen,true);assert.equal(sf.core_bad_015,true);
for(const k of flags)sf[k]=true;vm.runInNewContext(resetScript('records_reset_all_apply'),{sf});for(const k of flags)assert.equal(sf[k],false);assert.equal(sf.true_bad_seen,true);assert.deepEqual(sf.cg_view,{keep:true});
log.push(`March seven records/ten CG masked/unlocked, exact captions/record prose; ${regressions} earlier-month record states unchanged; monthly/all resets PASS.`);
// Runtime harness: actual installed custom-tag controller, fake media/DOM/clock only.
function harness(initialFlag=true,retryRun=true){
 let clock=0,id=0;const timers=new Map(),jumps=[],events={},plays=[],saves=[],stageStyles=[];let pads=[];
 class Element{
  constructor(type){this.type=type;this.style={};this.children=[];this.listeners={};this.currentTime=0;this.volume=1;this.parent=null;this.paused=false;}
  appendChild(c){this.children.push(c);c.parent=this;return c;}
  remove(){if(this.parent)this.parent.children=this.parent.children.filter(x=>x!==this);this.removed=true;}
  contains(e){return e===this||this.children.some(c=>c.contains(e));}
  addEventListener(t,fn){(this.listeners[t]??=[]).push(fn);}
  removeEventListener(t,fn){this.listeners[t]=(this.listeners[t]||[]).filter(f=>f!==fn);}
  dispatch(t,props={}){const e={type:t,target:this,preventDefault(){this.prevented=true;},stopImmediatePropagation(){this.stopped=true;},stopPropagation(){this.stopped=true;},...props};for(const fn of [...(this.listeners[t]||[])])fn(e);return e;}
  setAttribute(){} removeAttribute(){} load(){} pause(){this.paused=true;} play(){this.paused=false;return {catch:fn=>this.rejection=fn};}
 }
 class Audio{
  constructor(){this.listeners={};this.position=0;this.running=false;}
  on(t,fn){(this.listeners[t]??=[]).push(fn);}
  off(t,fn){this.listeners[t]=(this.listeners[t]||[]).filter(f=>f!==fn);}
  emit(t){if(t==='play')this.running=true;if(t==='end')this.running=false;for(const fn of [...(this.listeners[t]||[])])fn();}
  playing(){return this.running;} seek(){return this.position;} stop(){this.running=false;this.stopped=true;}unload(){this.unloaded=true;}
 }
 const document=new Element('document');document.body=new Element('body');document.createElement=t=>new Element(t);document.hidden=false;
 const kag={stat:{enable_keyconfig:true,ch_speed:'37',is_skip:true,is_auto:true,play_bgm:true,f:{scene:'',march_retry_run:retryRun}},config:{defaultBgmVolume:'42'},tmp:{map_bgm:{}},variable:{sf:{true_bad_seen:initialFlag,core_bad_017:true,true_end_seen:true,cg_march_event_07:true,normal_ch03_clear:true}},
  saveSystemVariable(){saves.push(JSON.parse(JSON.stringify(this.variable.sf)));},setSkip(v){this.stat.is_skip=v;},setAuto(v){this.stat.is_auto=v;},readyAudio(){this.tmp.ready_audio=true;},
  stronglyStop(){this.strong=true;},weaklyStop(){this.weak=true;},cancelStrongStop(){this.strong=false;},cancelWeakStop(){this.weak=false;},
  layer:{getLayer:(layer,page)=>({css:v=>stageStyles.push({layer,page,...v})})},
  key_mouse:{is_holding_skip:true,is_swipe:true,keyboard:{key_state_map:{Enter:{pressed:true,hold_frame:3,timer_id:0}}}},
  on(t,fn){events[t.split('.')[0]]=fn;},ftag:{master_tag:{},nextOrder(){kag.nextCount=(kag.nextCount||0)+1;},startTag(t,pm){
   if(t==='playbgm'){plays.push(pm);kag.tmp.map_bgm['0']=new Audio();kag.stat.current_bgm=pm.storage;}
   if(t==='stopbgm'){delete kag.tmp.map_bgm['0'];}
   if(t==='jump')jumps.push(pm);
  }}};
 const window={TYRANO:{kag},document,console:{error(){}},navigator:{getGamepads:()=>pads},setTimeout(fn,ms=0){const n=++id;timers.set(n,{at:clock+ms,fn});return n;},clearTimeout(n){timers.delete(n);}};
 window.window=window;
 vm.runInNewContext(runtime,{window,Date:{now:()=>clock}});
 function advance(ms){const end=clock+ms;let loops=0;while(true){const due=[...timers].filter(([i,t])=>t.at<=end).sort((a,b)=>a[1].at-b[1].at)[0];if(!due)break;assert.ok(++loops<10000);clock=due[1].at;timers.delete(due[0]);due[1].fn();}clock=end;}
 return {window,kag,document,plays,saves,jumps,events,advance,stageStyles,setPads:p=>pads=p,tag:(n,pm={})=>kag.ftag.master_tag[n].start(pm),timers};
}
{
 const h=harness(false);h.tag('march_true_begin');assert.equal(h.plays.length,0);assert.equal(h.jumps[0].target,'*scene_03_11a');
}
for(const retryRun of [false,undefined,null,'true',1]){
 const h=harness(true,retryRun);if(retryRun===undefined)delete h.kag.stat.f.march_retry_run;
 h.tag('march_true_begin');assert.equal(h.plays.length,0);assert.equal(h.jumps[0].target,'*scene_03_11a');assert.equal(h.kag.variable.sf.true_bad_seen,true);
}
{
 const h=harness();const oldSkip=h.kag.setSkip,oldAuto=h.kag.setAuto;
 h.tag('march_true_begin');assert.equal(h.plays.length,1);assert.equal(h.plays[0].loop,'false');assert.equal(h.plays[0].volume,'');
 assert.equal(h.kag.key_mouse.keyboard.key_state_map.Enter.pressed,false);assert.equal(h.kag.key_mouse.is_holding_skip,false);
 const audio=h.kag.tmp.map_bgm['0'];audio.emit('play');assert.equal(h.kag.nextCount,1);
 h.kag.setSkip(true);h.kag.setAuto(true);assert.equal(h.kag.stat.is_skip,false);assert.equal(h.kag.stat.is_auto,false);assert.equal(h.kag.stat.enable_keyconfig,false);
 h.tag('march_true_wait',{at:'4',minimum:'1000'});audio.position=4;h.advance(990);assert.equal(h.kag.nextCount,1);h.advance(100);assert.equal(h.kag.nextCount,2);
 h.tag('march_true_card');const card=h.document.body.children.find(e=>e.children[0]?.type==='img');card.children[0].onload();
 audio.position=273.24;h.advance(2500);h.document.dispatch('click');assert.equal(h.kag.nextCount,2,'duration/seek alone cannot complete');
 audio.emit('end');assert.equal(h.kag.nextCount,2,'no automatic return');
 h.document.dispatch('keydown',{key:'Enter',repeat:true});assert.equal(h.kag.nextCount,2);
 h.document.dispatch('keydown',{key:'Enter',repeat:false});assert.equal(h.kag.nextCount,3);assert.equal(h.saves.length,1);
 assert.equal(h.kag.setSkip,oldSkip);assert.equal(h.kag.setAuto,oldAuto);assert.equal(h.kag.stat.enable_keyconfig,true);assert.equal(h.kag.stat.ch_speed,'37');assert.equal(card.removed,true);assert.equal(audio.unloaded,true);
 assert.equal(h.stageStyles.length,2);assert.ok(h.stageStyles.every(s=>s['background-image']==='none'));
 h.document.dispatch('click');assert.equal(h.kag.nextCount,3);h.advance(600);assert.equal(h.timers.size,0);
}
{
 const h=harness();const old={running:true,volume:()=>0.4,playing(){return this.running;},once(t,fn){this.callback=fn;},off(){},stop(){this.running=false;this.stopped=true;},unload(){this.unloaded=true;}};
 h.kag.tmp.map_bgm['0']=old;h.tag('march_true_begin');assert.equal(h.plays.length,0);h.advance(179);assert.equal(h.plays.length,0);old.callback();assert.equal(h.plays.length,1);assert.equal(old.stopped,true);assert.equal(old.unloaded,true);h.advance(100);assert.equal(h.plays.length,1);h.window.MarchEnding.cleanup();
}
{
 const h=harness();h.setPads([{buttons:[{pressed:true}]}]);h.tag('march_true_begin');const audio=h.kag.tmp.map_bgm['0'];audio.emit('play');h.tag('march_true_card');h.document.body.children[0].children[0].onload();audio.emit('end');h.advance(2600);assert.equal(h.kag.nextCount,1,'held controller must not auto-confirm');h.setPads([{buttons:[{pressed:false}]}]);h.advance(100);h.setPads([{buttons:[{pressed:true}]}]);h.advance(100);assert.equal(h.kag.nextCount,2);
}
{
 const h=harness();h.tag('march_true_begin');const audio=h.kag.tmp.map_bgm['0'];audio.emit('play');h.tag('march_true_card');h.document.body.children[0].children[0].onload();audio.emit('end');
 h.advance(2399);h.document.dispatch('click');assert.equal(h.kag.nextCount,1);h.advance(1);h.document.dispatch('touchend');assert.equal(h.kag.nextCount,2);
}
{
 const h=harness();h.kag.stat.play_bgm=false;h.tag('march_true_begin');assert.equal(h.plays[0].volume,'0');assert.equal(h.kag.stat.play_bgm,false);h.window.MarchEnding.cleanup();
}
for(const event of ['loaderror','playerror']){
 const h=harness();h.tag('march_true_begin');const a=h.kag.tmp.map_bgm['0'];a.emit(event);const panel=h.document.body.children.find(n=>n.className==='march-media-recovery');assert.ok(panel);assert.ok(!h.kag.nextCount);
 h.document.dispatch('click');assert.ok(!h.kag.nextCount);h.window.MarchEnding.cleanup();assert.equal(panel.removed,true);assert.equal(h.kag.stat.enable_keyconfig,true);
}
{
 const h=harness();h.tag('march_true_begin');h.advance(20001);assert.ok(h.document.body.children.some(n=>n.className==='march-media-recovery'));h.window.MarchEnding.cleanup();
}
{
 const h=harness();h.tag('march_movie',{storage:'march_first_ending.mp4'});const video=h.document.body.children[0];assert.equal(video.type,'video');assert.equal(video.volume,0.42);assert.equal(h.plays.length,0);
 h.document.dispatch('click');assert.ok(!h.kag.nextCount);video.dispatch('ended');assert.equal(h.kag.nextCount,1);assert.equal(video.removed,true);video.dispatch('ended');assert.equal(h.kag.nextCount,1);assert.equal(h.kag.variable.sf.true_bad_seen,true); // unchanged by movie
}
{
 const h=harness(false);h.tag('march_movie',{storage:'march_first_ending.mp4'});const v=h.document.body.children[0];v.dispatch('error');const panel=h.document.body.children.find(n=>n.className==='march-media-recovery');assert.ok(panel);const proceed=panel.children[0].children.at(-1);proceed.dispatch('click');assert.equal(h.kag.nextCount,1);assert.equal(h.kag.variable.sf.true_bad_seen,false);
}
{
 const h=harness();const before={...h.kag.variable.sf};assert.equal(h.window.MarchEnding.ENABLE_MARCH_ED_DEBUG_RESET,false);assert.equal(h.window.MarchEnding.resetFirstEndingFlag(),false);assert.deepEqual(h.kag.variable.sf,before);assert.equal(h.saves.length,0);
 h.window.MarchEnding.ENABLE_MARCH_ED_DEBUG_RESET=true;assert.equal(h.window.MarchEnding.resetFirstEndingFlag(),true);assert.deepEqual(h.kag.variable.sf,{...before,true_bad_seen:false});assert.equal(h.saves.length,1);
 h.window.MarchEnding.ENABLE_MARCH_ED_DEBUG_RESET=false;h.kag.variable.sf.true_bad_seen=true;assert.equal(h.window.MarchEnding.resetFirstEndingFlag(),false);assert.equal(h.kag.variable.sf.true_bad_seen,true);assert.equal(h.saves.length,1);
 assert.equal(h.window.MarchEnding.playerName(''),'ユウ');assert.equal(h.window.MarchEnding.playerName('<あ>\n[お]'),'あお');
 h.tag('march_true_begin');h.events['load-start']();assert.equal(h.kag.stat.enable_keyconfig,true);assert.equal(h.timers.size,0);
 h.kag.stat.f.scene='03_true';h.kag.stat.current_scenario='make.ks';h.events['load-complete']();h.advance(20);h.kag.stat.current_scenario='n03_march.ks';h.advance(100);assert.equal(h.jumps[0].target,'*final_choice');
}
log.push('Runtime VM PASS: actual audio-end+1500ms gates, no auto return/repeat input, one-shot playback, text wait/read floor, muted transport, input/skip lock restoration, errors/stalls, movie ended/error recovery, release-disabled debug reset/no save mutation, load cleanup/restart. No actual UI/audio playback performed.');
console.log(log.join('\n'));
fs.writeFileSync(path.join(root,'static-evidence.json'),JSON.stringify({date:'2026-10-20',scenarios:files.length,jsChecks,references,earlierRecordStates:regressions,checks:log,runtimeVerification:'NOT RUN — user performs gameplay verification'},null,2));
