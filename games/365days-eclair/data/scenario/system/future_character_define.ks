; Future character registration (June onward). Registration only: no sprites are shown.
; Call this at the start of a future monthly scenario, including entry from older saves.
; Summer faces are selected explicitly by monthly scenarios; no automatic season switch.

[if exp="!TYRANO.kag.stat.charas['抹茶エクレア']"]
[chara_new name="抹茶エクレア" jname="抹茶エクレア" storage="apr_matcha_normal.png" width="440" height="660"]
[chara_face name="抹茶エクレア" face="energy" storage="apr_matcha_energy.png"]
[chara_face name="抹茶エクレア" face="quiet" storage="apr_matcha_quiet.png"]
[endif]
[chara_face name="抹茶エクレア" face="summer_normal" storage="matcha_summer_normal.png"]
[chara_face name="抹茶エクレア" face="summer_alt" storage="matcha_summer_alt.png"]
[chara_face name="抹茶エクレア" face="summer_quiet" storage="matcha_summer_quiet.png"]

[if exp="!TYRANO.kag.stat.charas['三好文子']"]
[chara_new name="三好文子" jname="三好文子" storage="apr_fumiko.png" width="420" height="630"]
[endif]
[chara_face name="三好文子" face="summer" storage="miyoshi_summer.png"]

[if exp="!TYRANO.kag.stat.charas['神田姫花']"]
[chara_new name="神田姫花" jname="神田姫花" storage="kanda_normal.png" width="440" height="660"]
[endif]
[chara_face name="神田姫花" face="normal" storage="kanda_normal.png"]
[chara_face name="神田姫花" face="alt" storage="kanda_alt.png"]
[chara_face name="神田姫花" face="summer_normal" storage="kanda_summer_normal.png"]
[chara_face name="神田姫花" face="summer_alt" storage="kanda_summer_alt.png"]

[if exp="!TYRANO.kag.stat.charas['久世玲']"]
[chara_new name="久世玲" jname="久世玲" storage="kuze_rei_normal.png" width="440" height="660"]
[endif]
[chara_face name="久世玲" face="normal" storage="kuze_rei_normal.png"]
[chara_face name="久世玲" face="alt" storage="kuze_rei_soft.png"]
[chara_face name="久世玲" face="september_normal" storage="kuze_rei_normal.png"]
[chara_face name="久世玲" face="september_soft" storage="kuze_rei_soft.png"]

[if exp="!TYRANO.kag.stat.charas['藤代誠']"]
[chara_new name="藤代誠" jname="藤代誠" storage="fujishiro_normal.png" width="440" height="660"]
[endif]
[chara_face name="藤代誠" face="normal" storage="fujishiro_normal.png"]

[return]
