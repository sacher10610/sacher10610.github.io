// Source/VM checks only. Never opens a game, save slot, or audio device.
const fs=require('fs'),path=require('path'),vm=require('vm'),assert=require('assert/strict');
const root=__dirname,stage=path.join(root,'stage'),web=path.resolve(root,'../games/365days-eclair');
const read=file=>fs.readFileSync(path.join(stage,'data/scenario',file),'utf8').replace(/\r\n/g,'\n');
const attrs=line=>Object.fromEntries([...line.matchAll(/(\w+)="([^"]*)"/g)].map(m=>[m[1],m[2]]));
const parserContext={tyrano:{plugin:{kag:{}}},$:{trim:s=>String(s).trim(),replaceAll:(s,a,b)=>s.split(a).join(b)}};
vm.runInNewContext(fs.readFileSync(path.join(web,'tyrano/plugins/kag/kag.parser.js'),'utf8'),parserContext);
const parser=parserContext.tyrano.plugin.kag.parser;
parser.kag={config:{KeepSpaceInParameterValue:'3'},stat:{current_scenario:''},warning:(...v)=>{throw Error(v.join(' '));},error:(...v)=>{throw Error(v.join(' '));},convertLang(){}};
for(const file of ['title_screen.ks','n04_april.ks','n03_march.ks']){
 const before=parser.parseScenario(fs.readFileSync(path.join(root,'retry-run-gate-baseline/web/data/scenario',file),'utf8'));
 const after=parser.parseScenario(read(file));
 assert.deepEqual(after.map_label,before.map_label,file+' existing SAVE labels/line positions');
 if(file!=='title_screen.ks')assert.equal(after.array_s.length,before.array_s.length);
}
function walk(file,label,initialF={},initialSf={}){
 const f={...initialF},sf={...initialSf},ctx={f,sf},stack=[];let lines,index,buttons=[];
 const enter=(name,target)=>{file=name;lines=read(file).split('\n');index=lines.indexOf('*'+target)+1;assert.ok(index>0,target);};
 enter(file,label);
 for(let steps=0;steps<3000;steps++){
  const line=lines[index++];assert.notEqual(line,undefined,file+' fell through');const a=attrs(line),tag=line.match(/^\[([^\s\]]+)/)?.[1];
  const active=()=>stack.every(c=>c.active),run=code=>vm.runInNewContext(code,ctx);
  if(tag==='iscript'){let script='';while(lines[index]!=='[endscript]')script+=lines[index++]+'\n';index++;if(active())run(script);continue;}
  if(tag==='if'){const parent=active(),ok=parent&&Boolean(run(a.exp));stack.push({parent,active:ok,seen:ok});continue;}
  if(tag==='else'){const c=stack.at(-1);c.active=c.parent&&!c.seen;c.seen=true;continue;}
  if(tag==='elsif'){const c=stack.at(-1);c.active=c.parent&&!c.seen&&Boolean(run(a.exp));c.seen||=c.active;continue;}
  if(tag==='endif'){assert.ok(stack.pop());continue;}
  if(!active())continue;
  if(tag==='eval')run(a.exp);
  if(tag==='clearstack')stack.length=0;
  if(tag==='cm')buttons=[];
  if(tag==='glink')buttons.push(a);
  if(tag==='jump'){
   if(a.target==='*title')return {f,sf,blocked:true};
   enter(a.storage||file,a.target.slice(1));
  }
  if(tag==='s')return {f,sf,buttons};
 }
 throw Error('Walk exceeded limit');
}
const completed={true_bad_seen:true,core_bad_001:true,core_bad_017:true,true_end_seen:true,cg_march_event_07:true};
const normal=walk('title_screen.ks','start',{march_retry_run:true},completed);
assert.equal(normal.f.scene,'name_input');assert.equal(normal.f.march_retry_run,false);assert.deepEqual(normal.sf,completed);
const retry=walk('title_screen.ks','march_restart',{march_retry_run:false},completed);
assert.equal(retry.f.scene,'name_input');assert.equal(retry.f.march_retry_run,true);assert.deepEqual(retry.sf,completed);
const first=walk('title_screen.ks','start',{},{});assert.equal(first.f.march_retry_run,false);
const blocked=walk('title_screen.ks','march_restart',{},{});assert.equal(blocked.blocked,true);assert.notEqual(blocked.f.march_retry_run,true);
// Native saves retain kag.stat.f; verify each saved run's flag survives independent round trips.
const retrySave=JSON.parse(JSON.stringify({stat:{f:retry.f}}));
const normalSave=JSON.parse(JSON.stringify({stat:{f:normal.f}}));
const again=walk('title_screen.ks','start',retry.f,completed);assert.equal(again.f.march_retry_run,false);
assert.equal(retrySave.stat.f.march_retry_run,true);assert.equal(normalSave.stat.f.march_retry_run,false);
const hasInsight=result=>result.buttons.some(b=>b.target==='*april_march_insight');
for(const [run,expected] of [[normal.f,false],[retrySave.stat.f,true],[normalSave.stat.f,false],[{},false]]){
 const page=walk('n04_april.ks','choice_04_production',run,completed);
 assert.equal(hasInsight(page),expected);assert.equal(page.buttons.some(b=>b.target==='*choice_04_c'),true,'Keep ordinary learned choices');
 assert.deepEqual(page.sf,completed);
}
assert.equal(hasInsight(walk('n04_april.ks','choice_04_production',{march_retry_run:true},{})),false);
assert.equal(hasInsight(walk('n04_april.ks','april_march_insight',{},completed)),false,'Old/ordinary saves cannot enter extra dialogue directly');
let gateCases=0;
for(const file of ['n04_april.ks','n03_march.ks']){
 const gates=parser.parseScenario(read(file)).array_s.filter(t=>t.name==='if'&&t.pm.exp.includes('sf.true_bad_seen'));
 assert.equal(gates.length,file==='n04_april.ks'?2:4);
 for(const gate of gates)for(const seen of [false,true])for(const retryRun of [undefined,false,true,'true',1]){
  const f={current_march_end:'march_end_01',march_retry_run:retryRun},sf={true_bad_seen:seen};
  const allowed=seen===true&&retryRun===true,expected=gate.pm.exp.includes('!==')?!allowed:allowed;
  assert.equal(vm.runInNewContext(gate.pm.exp,{f,sf}),expected,gate.pm.exp);gateCases++;
 }
}
console.log(`PASS: normal start resets retry eligibility, dedicated start requires completion, name input preserves run state, global records unchanged, per-save round trips/old-save default, April actual menus/direct-entry guard, ${gateCases} April/March gate cases, all existing labels unchanged.`);
fs.writeFileSync(path.join(root,'retry-run-gate-evidence.json'),JSON.stringify({date:'2026-10-21',normalStart:true,dedicatedRetry:true,firstPassCannotRetry:true,recordsPreserved:true,saveStateRoundTrip:true,legacySaves:'ordinary unless march_retry_run is explicitly true',aprilMenus:true,gateCases,existingLabelOffsetsUnchanged:true,runtime:'Source/VM only; no actual UI or user SAVE/LOAD'},null,2));
