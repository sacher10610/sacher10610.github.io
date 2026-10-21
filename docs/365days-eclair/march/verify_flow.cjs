// Source-state walk only. Does not launch a browser, game, audio device or read a user save.
const fs=require('fs'),path=require('path'),vm=require('vm'),assert=require('assert/strict');
const root=__dirname,stage=path.join(root,'stage/data/scenario'),web=path.resolve(root,'../games/365days-eclair/data/scenario');
const read=n=>fs.readFileSync(fs.existsSync(path.join(stage,n))?path.join(stage,n):path.join(web,n),'utf8').replace(/\r\n/g,'\n');
const attrs=t=>Object.fromEntries([...t.matchAll(/(\w+)="([^"]*)"/g)].map(m=>[m[1],m[2]]));
function simulate(picks,initial={}){
 const lines=read('n03_march.ks').split('\n'),labels=Object.fromEntries(lines.flatMap((l,i)=>l.startsWith('*')?[[l.slice(1),i]]:[]));
 const f={player_name:'雑葉'},sf={...initial},charas={},shown=new Set(),images=new Set(),events=[],calls=[];
 const kag={stat:{charas,f,current_bgm:''},layer:{getLayer:()=>({css(){}})}};
 const context={f,sf,TYRANO:{kag},window:{MarchEnding:{cleanup(){},playerName:v=>v||'ユウ'}}};const run=s=>vm.runInNewContext(s,context);
 let i=labels.eyecatch_02_03,steps=0,conditions=[],buttons=[],movieCount=0,trueCount=0,yearStarts=0,bg='';
 const scriptText=[];
 function defineFuture(){
  let enabled=true;
  for(const line of read('system/future_character_define.ks').split('\n')){
   const a=attrs(line);
   if(line.startsWith('[if ')){enabled=Boolean(run(a.exp));continue;}
   if(line==='[endif]'){enabled=true;continue;}
   if(!enabled)continue;
   if(line.startsWith('[chara_new ')){assert.ok(!charas[a.name]);charas[a.name]={faces:{default:a.storage}};}
   if(line.startsWith('[chara_face ')){assert.ok(charas[a.name]);charas[a.name].faces[a.face]=a.storage;}
  }
 }
 while(i<lines.length){
  assert.ok(++steps<30000,'source flow did not terminate');const line=lines[i++],a=attrs(line),tag=line.match(/^\[([^\s\]]+)/)?.[1];
  if(tag==='if'){const parent=conditions.every(c=>c.active),ok=parent&&Boolean(run(a.exp));conditions.push({parent,active:ok,seen:ok});continue;}
  if(tag==='else'){const c=conditions.at(-1);c.active=c.parent&&!c.seen;c.seen=true;continue;}
  if(tag==='elsif'){const c=conditions.at(-1);c.active=c.parent&&!c.seen&&Boolean(run(a.exp));c.seen||=c.active;continue;}
  if(tag==='endif'){conditions.pop();continue;}
  if(!conditions.every(c=>c.active))continue;
  if(tag==='clearstack'){conditions=[];continue;}
  if(tag==='iscript'){let script='';while(lines[i]!=='[endscript]')script+=lines[i++]+'\n';i++;run(script);continue;}
  if(tag==='eval'){run(a.exp);continue;}
  if(tag==='emb'){scriptText.push(run(a.exp));continue;}
  if(tag==='jump'){
   if(a.storage==='title_screen.ks')return {ending:'title',f,sf,events,movieCount,trueCount,yearStarts,scriptText};
   assert.ok(!a.storage||a.storage==='n03_march.ks');i=labels[a.target.slice(1)];assert.notEqual(i,undefined,a.target);continue;
  }
  if(tag==='call'){
   if(a.storage==='system/future_character_define.ks')defineFuture();
   else if(a.target==='*march_character_define'){calls.push(i);i=labels.march_character_define;}
   else if(a.target==='*show_mini_bad'){assert.equal(images.size,0);assert.equal(f.april_bad.month,'03');events.push('MINI:'+f.april_bad.id);}
   continue;
  }
  if(tag==='return'){assert.ok(calls.length);i=calls.pop();continue;}
  if(tag==='register_mini_bad'){sf['mini_bad_'+a.id]=true;continue;}
  if(tag==='chara_new'){assert.ok(!charas[a.name]);charas[a.name]={faces:{default:a.storage}};continue;}
  if(tag==='chara_mod'){assert.ok(charas[a.name]?.faces[a.face],a.name+' missing face '+a.face);continue;}
  if(tag==='chara_hide'){assert.ok(charas[a.name],'undefined hide '+a.name);shown.delete(a.name);continue;}
  if(tag==='chara_show'){assert.ok(charas[a.name],'undefined show '+a.name);assert.equal(images.size,0);shown.add(a.name);continue;}
  if(tag==='image'&&a.name.startsWith('march_sdcg')){assert.equal(shown.size,0);images.add(a.name);continue;}
  if(tag==='free'&&a.name.startsWith('march_sdcg')){images.delete(a.name);continue;}
  if(tag==='bg'){bg=a.storage;if(bg.startsWith('cg/march')){assert.equal(shown.size,0);events.push(bg.match(/(?:CG|SD)15_\d\d/)[0]);}continue;}
  if(tag==='xchgbgm'){kag.stat.current_bgm=a.storage;if(a.storage.startsWith('06_'))yearStarts++;continue;}
  if(tag==='stopbgm'){kag.stat.current_bgm='';continue;}
  if(tag==='march_movie'){assert.equal(sf.true_bad_seen===true,false);assert.equal(kag.stat.current_bgm,'');assert.equal(shown.size,0);assert.ok(!bg.startsWith('cg/'));assert.equal(images.size,0);movieCount++;events.push('MOVIE_ENDED');continue;}
  if(tag==='march_true_begin'){assert.equal(sf.true_bad_seen,true);assert.equal(movieCount,0);trueCount++;continue;}
  if(tag==='march_true_card'){assert.equal(trueCount,1);sf.true_end_seen=true;continue;}
  if(tag==='cm'){buttons=[];continue;}
  if(tag==='glink'){buttons.push(a);continue;}
  if(tag==='s'){
   if(!picks.length)return {ending:'menu',f,sf,buttons,events,movieCount,trueCount,yearStarts,scriptText};
   const choice=picks.shift();const button=buttons.find(b=>b.target==='*'+choice);assert.ok(button,choice+' not offered: '+buttons.map(b=>b.target));buttons=[];i=labels[choice];assert.notEqual(i,undefined);continue;
  }
 }
 throw Error('fell through scenario');
}
const base=['correct_03_00','correct_03_01'];
const first=simulate([...base]);
assert.equal(first.ending,'menu');assert.equal(first.f.current_march_end,'core_017');assert.equal(first.sf.true_bad_seen,true);assert.equal(first.sf.core_bad_017,true);assert.equal(first.sf.normal_ch03_clear,true);assert.equal(first.movieCount,1);assert.equal(first.trueCount,0);assert.equal(first.yearStarts,1);
assert.deepEqual(first.events.filter(e=>e.startsWith('CG')),['CG15_01','CG15_02','CG15_03','CG15_04','CG15_05','CG15_06']);assert.ok(!first.sf.cg_march_event_07&&!first.sf.true_end_seen);
const debugFirst=simulate([...base],{core_bad_017:true,true_bad_seen:false,true_end_seen:true});assert.equal(debugFirst.movieCount,1);assert.equal(debugFirst.sf.true_end_seen,true);
const mini=simulate(['mini_m12_entry','mini_m13_entry','correct_03_00','review_03_a','review_03_b','correct_03_01']);assert.equal(mini.sf.mini_bad_m12,true);assert.equal(mini.sf.mini_bad_m13,true);assert.equal(mini.sf.cg_march_mini_01,true);assert.equal(mini.sf.cg_march_mini_02,true);assert.equal(mini.movieCount,1);
const known=simulate(['mini_m12_entry',...base],{mini_bad_m12:true});assert.ok(!known.events.includes('MINI:m12'));assert.ok(!known.sf.cg_march_mini_01);
for(const number of [1,2]){
 const result=simulate([...base,'normal_end_0'+number],{true_bad_seen:true});assert.equal(result.movieCount,0);assert.equal(result.trueCount,0);assert.equal(result.sf['march_end_0'+number+'_seen'],true);assert.ok(!result.sf.true_end_seen);assert.equal(result.f.current_march_end,'march_end_0'+number);assert.equal(result.yearStarts,1);assert.ok(!result.events.includes('CG15_05'));
}
const trueRoute=simulate([...base,'true_end_entry'],{true_bad_seen:true});assert.equal(trueRoute.ending,'title');assert.equal(trueRoute.trueCount,1);assert.equal(trueRoute.movieCount,0);assert.equal(trueRoute.sf.true_end_seen,true);assert.equal(trueRoute.yearStarts,1);assert.deepEqual(trueRoute.events.filter(e=>e.startsWith('CG')),['CG15_01','CG15_02','CG15_03','CG15_04','CG15_07','CG15_08']);
assert.deepEqual(trueRoute.scriptText,['「あんた……いや、雑葉と一緒に、な」','「……なあ、雑葉」']);
console.log('Source flow PASS: first ending, repeat after debug reset, both MINI/retry and known MINI, both REVIEW retries, two normal ENDs, TRUE/name expansion; registration and image cleanup; One Year starts once and carries through scene10/FINAL. No actual game/save operation.');
fs.writeFileSync(path.join(root,'flow-evidence.json'),JSON.stringify({firstEnding:true,debugFirstEnding:true,miniAndReviews:true,knownMini:true,normalEnds:[1,2],trueRoute:true,firstNameExpansion:true,registration:true,yearContinuity:true,runtime:'NOT RUN'},null,2));
