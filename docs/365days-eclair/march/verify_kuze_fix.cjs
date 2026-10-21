// Exercises the bundled engine's real character tags with in-memory state only.
// No browser/game interaction, user save access, or real image loading.
const fs=require('fs'),path=require('path'),vm=require('vm'),assert=require('assert/strict');
const root=__dirname,web=path.resolve(root,'../games/365days-eclair'),live='C:/Program Files (x86)/Steam/steamapps/common/TyranoBuilder/myproject/365days_eclair';
const read=(base,rel)=>fs.readFileSync(path.join(base,rel),'utf8').replace(/\r\n/g,'\n');
const before=read(path.join(root,'kuze-fix-baseline/live'),'data/scenario/n03_march.ks');
const march=read(path.join(root,'kuze-fix-stage'),'data/scenario/n03_march.ks');
const future=read(path.join(root,'kuze-fix-stage'),'data/scenario/system/future_character_define.ks');
const attrs=t=>Object.fromEntries([...t.matchAll(/(\w+)="([^"]*)"/g)].map(m=>[m[1],m[2]]));
const mods=[...march.matchAll(/^\[chara_mod name="久世玲"[^\n]*\]/gm)].map(m=>attrs(m[0]));
const shows=[...march.matchAll(/^\[chara_show name="久世玲"[^\n]*\]/gm)].map(m=>attrs(m[0]));
assert.equal(mods.length,4);assert.equal(shows.length,4);
assert.ok(mods.every(a=>a.face==='normal'));assert.ok(shows.every(a=>a.storage==='kuze_rei_normal.png'));
assert.equal(march.split('\n').length,before.split('\n').length,'Preserve saved line positions');
assert.equal(march.replaceAll('face="normal"','face="default"').replaceAll(' storage="kuze_rei_normal.png"','').replace('「まだなってないから」','「まずは、まだなってないから」'),before);
assert.ok(march.includes('「……世界一になったら、どうなるんやろ」\n[p]\n#主人公\n「まだなってないから」'));
assert.equal(future.replace('; Refresh the default alias even for characters restored from older saves.\n[chara_face name="久世玲" face="default" storage="kuze_rei_normal.png"]\n',''),read(path.join(root,'kuze-fix-baseline/live'),'data/scenario/system/future_character_define.ks'));
function query(empty=false){const q={length:empty?0:1,get:()=>empty?undefined:{},css:()=>q,attr:()=>q,addClass:()=>q,append:()=>q,find:()=>query(true),stop:()=>q};return q;}
const $=()=>query();$.isHTTP=s=>/^https?:/.test(s);$.parseStorage=(s,folder)=>'./data/'+folder+'/'+s;$.trim=s=>String(s).trim();$.replaceAll=(s,a,b)=>s.split(a).join(b);
const context={tyrano:{plugin:{kag:{tag:{}}}},$};
vm.runInNewContext(fs.readFileSync(path.join(web,'tyrano/plugins/kag/kag.tag_ext.js'),'utf8'),context);
vm.runInNewContext(fs.readFileSync(path.join(web,'tyrano/plugins/kag/kag.parser.js'),'utf8'),context);
const tag=context.tyrano.plugin.kag.tag,parser=context.tyrano.plugin.kag.parser;
parser.kag={config:{KeepSpaceInParameterValue:'3'},stat:{},convertLang(){},error:m=>assert.fail(m),warning:m=>assert.fail(m)};
const oldParsed=parser.parseScenario(before),newParsed=parser.parseScenario(march);
assert.equal(newParsed.array_s.length,oldParsed.array_s.length);
for(const name of Object.keys(oldParsed.map_label))assert.equal(newParsed.map_label[name].index,oldParsed.map_label[name].index,'Old save label cursor '+name);
const registrations=parser.parseScenario(future).array_s.filter(t=>t.name==='chara_face'&&t.pm.name==='久世玲');
function fixture(defaultFile='kuze_normal.png',normalFile='kuze_normal.png'){
 const chara={storage:defaultFile,map_face:{default:defaultFile,normal:normalFile},is_show:'false',width:'440',height:'660',marker:'keep'};
 const requests=[];
 const kag={stat:{charas:{'久世玲':chara}},ftag:{nextOrder(){}},weaklyStop(){},cancelWeakStop(){},chara:{getCharaContainer:()=>query(true),setPartContainer(){}},preloadAll:urls=>requests.push(...urls),error:m=>assert.fail(m)};
 function start(name,pm){const obj={...tag[name],kag};obj.start({...obj.pm,...pm});}
 return {chara,requests,start};
}
const old=fixture();old.start('chara_mod',attrs(before.match(/^\[chara_mod name="久世玲"[^\n]*\]/m)[0]));old.start('chara_show',attrs(before.match(/^\[chara_show name="久世玲"[^\n]*\]/m)[0]));
assert.equal(old.requests[0],'./data/fgimage/kuze_normal.png');assert.equal(fs.existsSync(path.join(live,old.requests[0].slice(2))),false,'Reproduce the reported missing live file');
for(const fresh of [false,true])for(const applyRegistration of [false,true])for(let i=0;i<4;i++){
 const state=fixture(fresh?'kuze_rei_normal.png':'kuze_normal.png',fresh?'kuze_rei_normal.png':'kuze_normal.png');
 if(applyRegistration)for(const t of registrations)state.start(t.name,t.pm);
 if(applyRegistration)assert.equal(state.chara.map_face.default,'kuze_rei_normal.png');
 state.start('chara_mod',mods[i]);state.start('chara_show',shows[i]);
 assert.equal(state.requests[0],'./data/fgimage/kuze_rei_normal.png');assert.equal(state.chara.storage,'kuze_rei_normal.png');assert.equal(state.chara.marker,'keep');assert.equal(state.chara.width,'440');assert.equal(state.chara.height,'660');
 for(const base of [web,live])assert.ok(fs.existsSync(path.join(base,state.requests[0].slice(2))));
}
console.log('PASS: reproduced original missing Kuze file with bundled character tags; all four March appearances load the correct file across 16 fresh/legacy/registration-bypassed states. Existing dimensions/state retained; chapter tag/label indices unchanged; exactly one dialogue corrected. No real game/save operation.');
