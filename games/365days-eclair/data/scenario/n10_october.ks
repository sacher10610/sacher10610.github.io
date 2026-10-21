; CHAPTER 10 / OCTOBER - 世界一ってなんや？
; Confirmed dialogue: October pack v1. Month-end music overridden by user on 2026-10-12.
*eyecatch_09_10
[skipstop]
[clearstack stack="if"]
[cm]
[clearfix]
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[mask time="700" color="0x000000"]
[stopbgm fadeout="true" time="700"]
[stopse]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="eyecatch/EYECATCH_09_10_OCTOBER.png" time="0"]
[tb_hide_message_window]
[mask_off time="400"]
[playse storage="SE_EYECATCH_05_06_Jingle.wav" volume="75" loop="false"]
[wait time="3100"]
[mask time="400" color="0x000000"]
[stopse]
[jump target="*scene_10_01"]

*scene_10_01
[call storage="system_common.ks"]
[call storage="system/future_character_define.ks"]
[clearstack stack="if"]
[cm]
[clearfix]
[hidemenubutton]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
[restore_april_quick_menu]
[eval exp="f.chapter = '10'; f.scene = '10_01'"]
[mask_off time="500"]
#主人公
「ごめん。ちょっと買い物、頼める？」
[p]
#抹茶エクレア
「ええけど。何買うん？」
[p]
#主人公
「包装用の袋とラベル用紙。発注した分がまだ届かなくて」
[p]
#抹茶エクレア
「お菓子は？」
[p]
#主人公
「今日はそっちじゃない」
[p]
#抹茶エクレア
「ウチがお菓子の店から出て、お菓子以外を買うんか」
[p]
#主人公
「ただのお使いだよ」
[p]
#抹茶エクレア
「重大任務やな」
[p]
#主人公
「違うよ」
[p]
#抹茶エクレア
「お使いなら前にも行ったやろ」
[p]
#主人公
「だから『はじめてのお使い』みたいな顔しなくていいから」
[p]
#抹茶エクレア
「してへんて」
[p]
#主人公
「買うもの、メモして」
[p]
#抹茶エクレア
「まかしとき。袋、ラベル、あと世界一」
[p]
#主人公
「最後のは売ってない」
[p]
#抹茶エクレア
「念のためや」
[p]
#主人公
「念のためって何？」
[p]
*scene_10_01_street
[eval exp="f.chapter = '10'; f.scene = '10_01_street'"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="BG10_01_Autumn_Errand.png" time="0"]
[xchgbgm storage="04_Matcha_Has_Arrived.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
#抹茶エクレア
「袋よし。ラベルよし」
[p]
#抹茶エクレア
「世界一は売り切れやったな」
[p]
#抹茶エクレア
「……ん？」
[p]
[chara_mod name="神田姫花" face="normal"]
[chara_show name="神田姫花" left="120" top="90" time="250"]
#抹茶エクレア
「神田ちゃん？」
[p]
#抹茶エクレア
「神田ちゃーん」
[p]
#抹茶エクレア
「何をそんな一生懸命……」
[p]

*scene_10_02
[eval exp="f.chapter = '10'; f.scene = '10_02'"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="BG10_02_The_Quiet_Bench.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="神田姫花" face="normal"]
[chara_show name="神田姫花" left="120" top="90" time="250"]
[mask_off time="550"]
#抹茶エクレア
「……何してるん？」
[p]
#神田姫花
「ひゃっ！？」
[p]
#神田姫花
「ま、抹茶ちゃん！？　いつからそこに？」
[p]
#抹茶エクレア
「今来たとこ。めっちゃ真剣やったな」
[p]
#神田姫花
「べ、別に。ちょっとメモを……」
[p]
#抹茶エクレア
「ほななんで閉じたん？」
[p]
#神田姫花
「反射です！」
[p]
#抹茶エクレア
「そうなんや」
[p]
[skipstop]
[eval exp="sf.cg_october_event_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="cg/october/CG10_01_The_Dark_Emperors_Notebook.png" time="500"]
#抹茶エクレア
「……暗黒皇帝？」
[p]
#神田姫花
「見たんですか！？」
[p]
#抹茶エクレア
「表紙のすみっこに書いてあったで。『暗黒皇帝設定集・改訂第六版』って」
[p]
#神田姫花
「声に出さないでください！」
[p]
#抹茶エクレア
「六回も改訂したん？」
[p]
#神田姫花
「そこはいいじゃないですか！」
[p]
#抹茶エクレア
「何の皇帝なん？」
[p]
#神田姫花
「架空の世界の、架空の人物です。私が考えた……創作の設定です」
[p]
#抹茶エクレア
「ほほう」
[p]
#神田姫花
「その顔やめてください」
[p]
#抹茶エクレア
「神田ちゃん、皇帝やったんやな」
[p]
#神田姫花
「私じゃありません！」
[p]
#抹茶エクレア
「暗黒皇帝・神田姫花」
[p]
#神田姫花
「違いますってば！」
[p]
#抹茶エクレア
「陛下、本日はええお天気で」
[p]
#神田姫花
「やめてくださいっ！💦」
[p]
[wait time="350"]
[bg storage="BG10_02_The_Quiet_Bench.png" time="450"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[chara_mod name="神田姫花" face="normal"]
[chara_show name="神田姫花" left="120" top="90" time="250"]
#抹茶エクレア
「……でも、そんなに真剣に考えてるんやな」
[p]
#神田姫花
「……好きなんです。考えるの」
[p]
#抹茶エクレア
「それは伝わったわ」
[p]
#神田姫花
「世界の歴史とか、登場人物同士の関係とか、あと……」
[p]
#抹茶エクレア
「その皇帝、何する人なん？」
[p]
#神田姫花
「えっと、もともとは帝国の第七継承者なんですけど、第二紀の内乱で王位継承権を失って、それで黒曜の……」
[p]
#抹茶エクレア
「待って待って」
[p]
#神田姫花
「はい？」
[p]
#抹茶エクレア
「今、何の話してるん？」
[p]
#神田姫花
「暗黒皇帝の生い立ちですけど」
[p]
#抹茶エクレア
「そもそも、何をしたい皇帝なん？」
[p]
#神田姫花
「……あ」
[p]
#神田姫花
「世界征服を目指す、ものすごく偉そうな皇帝です」
[p]
#抹茶エクレア
「……最初にそれ言うて！　めっちゃ分かりやすいやん」
[p]
#神田姫花
「え？」
[p]
#抹茶エクレア
「さっきの七なんとかより、ずっと分かりやすい」
[p]
#神田姫花
「……確かに、最初から説明するなら、そっちですね」
[p]
#抹茶エクレア
「好きなもんって、知ってること多すぎて、どっから話したらええか分からんもんな」
[p]
#神田姫花
「抹茶ちゃんにも、そういうことあります？」
[p]
#抹茶エクレア
「抹茶エクレアの話なら朝までいけるで」
[p]
#神田姫花
「それ、たぶん同じです」
[p]
#抹茶エクレア
「……同じやな」
[p]
#神田姫花
「……あの」
[p]
#抹茶エクレア
「ん？」
[p]
#神田姫花
「このこと、ほかの人には……」
[p]
#抹茶エクレア
「言わへんよ。神田ちゃんの大事なもんなんやろ？」
[p]
#神田姫花
「……はい」
[p]
#抹茶エクレア
「ただし」
[p]
#神田姫花
「ただし？」
[p]
#抹茶エクレア
「二人の時は、陛下って呼んでもええ？」
[p]
#神田姫花
「それもやめてください！」
[p]
#抹茶エクレア
「はーい」
[p]

*scene_10_03
[eval exp="f.chapter = '10'; f.scene = '10_03'"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_kitchen_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
#主人公
「おかえり。買えた？」
[p]
#抹茶エクレア
「完璧やで。袋とラベル」
[p]
#主人公
「ありがとう。助かった」
[p]
#抹茶エクレア
「あと、暗黒……」
[p]
#主人公
「暗黒？」
[p]
#抹茶エクレア
「……なんでもない。お使いの帰りに神田ちゃんと会うた」
[p]
#主人公
「元気だった？」
[p]
#抹茶エクレア
「元気。なんか楽しそうやった」
[p]
#主人公
「そっか」
[p]
[playse storage="se_phone_notify.wav" volume="65" loop="false"]
#主人公
「……あれ？」
[p]
#抹茶エクレア
「どうしたん？」
[p]
#主人公
「海外からメール」
[p]
#抹茶エクレア
「海外！？」
[p]
#主人公
「九月の催事を紹介した投稿から、うちを知ったらしい」
[p]
#抹茶エクレア
「ついに世界進出や！」
[p]
#主人公
「まだメール一通だよ」
[p]
#抹茶エクレア
「一通から世界は始まるんや」
[p]
#主人公
「大きく言うね」
[p]
#抹茶エクレア
「なんて？」
[p]
#主人公
「海外向けの小さな菓子紹介企画。まずは商品について取材して、来日する担当者が試食できないか、って」
[p]
#抹茶エクレア
「試食やったらまかしとき！」
[p]
#主人公
「ただ、商品説明と取り扱い条件を送ってほしいらしい」
[p]
#抹茶エクレア
「抹茶エクレアです、でええやろ」
[p]
#主人公
「……それだけじゃ足りないかも」
[p]
#抹茶エクレア
「なんで？」
[p]
#主人公
「海外だと、抹茶の苦さも、エクレアの中身も知らない人がいるから」
[p]
#抹茶エクレア
「……それは」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「……神田ちゃんと一緒や」
[p]
#主人公
「神田さん？」
[p]
#抹茶エクレア
「説明、最初から全部するん難しいねんな」
[p]
#主人公
「何の説明？」
[p]
#抹茶エクレア
「ひみつ」
[p]
#主人公
「珍しい」
[p]
#抹茶エクレア
「まあ、そのうち分かるかもしれへん」
[p]
#主人公
「……？」
[p]

*scene_10_04
[eval exp="f.chapter = '10'; f.scene = '10_04'"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_morning.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
#主人公
「向こうから追加で質問が来たよ」
[p]
#抹茶エクレア
「なんて？」
[p]
#主人公
「まずは『どんなお菓子か』。それと、甘さ、抹茶の風味、原材料、持ち歩き方」
[p]
#抹茶エクレア
「抹茶エクレアやって言うてるのに」
[p]
#主人公
「だから、その『抹茶エクレア』を説明しないと」
[p]
#抹茶エクレア
「……中はクリームで、外は生地で、抹茶の香りがして」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ちょっとほろ苦くて、甘いねん」
[p]
#主人公
「それ、すごくいいと思う」
[p]
#抹茶エクレア
「え？」
[p]
#主人公
「最初から説明するなら、そのくらいが分かりやすい」
[p]
#抹茶エクレア
「……暗黒皇帝より簡単やった」
[p]
#主人公
「何が？」
[p]
#抹茶エクレア
「独り言や」
[p]
#主人公
「気になるなあ」
[p]
#主人公
「……もう一通。こっちは現地向けの企画商品も考えないか、って」
[p]
#抹茶エクレア
「企画商品？」
[p]
#主人公
「現地で売りやすいように、甘さや形や日持ちを大きく変える案だって」
[p]
#抹茶エクレア
「売れるんやったら、ええんちゃう？」
[p]
#主人公
「その代わり、製造の手間が増えて、普段の店はかなり縮小する必要がある」
[p]
#抹茶エクレア
「えっ」
[p]
#主人公
「逆に、今のまま何も説明しないで紹介する方法もあるけど……」
[p]
#抹茶エクレア
「うーん」
[p]
#主人公
「世界に届けるなら、何を優先しよう」
[p]

*choice_10_01
[eval exp="f.chapter = '10'; f.scene = '10_choice_01'"]
[clearstack stack="if"]
[cm]
[glink text="海外で売れる形に、全部作り変えよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="100" size="21" y="205" bold="true" target="*bad010_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="本物なら、説明しなくても伝わるはず" color="green" font_color="0x3B2A1B" x="310" width="660" height="100" size="21" y="325" bold="true" target="*bad011_entry" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[glink text="味は守って、伝え方と届け方を工夫しよう" color="green" font_color="0x3B2A1B" x="310" width="660" height="100" size="21" y="445" bold="true" target="*correct_10" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_choice"]
[s]

*bad010_entry
[if exp="sf.core_bad_010 === true"]
[cm]
#
その結末は、もう知っている。
[p]
[jump target="*choice_10_01"]
[endif]
[jump target="*bad_10_010"]

*bad_10_010
[eval exp="f.chapter = '10'; f.scene = '10_bad010'"]
[cm]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
#主人公
「海外で売れる形に、全部作り変えよう」
[p]
#抹茶エクレア
「せやな！　世界一狙うんやもんな！」
[p]
#主人公
「甘さを強くして、冷蔵がいらない形に変えて……」
[p]
#抹茶エクレア
「大きさも変える？」
[p]
#主人公
「現地向けの提案に合わせよう」
[p]
#抹茶エクレア
「抹茶の苦味は？」
[p]
#主人公
「向こうは弱めがいいって」
[p]
#抹茶エクレア
「……せやけど、まあ、売れるなら」
[p]
#主人公
「試作の数、増やそう」
[p]
#抹茶エクレア
「いつものエクレアは？」
[p]
#主人公
「今月は少なめで」
[p]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
#抹茶エクレア
「形、だいぶ変わったな」
[p]
#主人公
「でも現地企画の担当は気に入ってる」
[p]
#抹茶エクレア
「クリームも、もう前と違うな」
[p]
#主人公
「常温向けにするなら仕方ない」
[p]
#抹茶エクレア
「……そうやな」
[p]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
#主人公
「現地の期間限定企画、初回分は完売だって」
[p]
#抹茶エクレア
「完売！？」
[p]
#主人公
「うん。数字、すごいよ」
[p]
#抹茶エクレア
「やった！　海外でも売れた！」
[p]
#客
「すみません。いつもの抹茶エクレアは……？」
[p]
#主人公
「……すみません、今は作れてなくて」
[p]
#客
「そうですか。あれが好きだったんですが……」
[p]
[playse storage="se_shop_door_chime.wav" volume="75" loop="false"]
#抹茶エクレア
「……」
[p]
#主人公
「海外の分を優先したから、店の仕込みが追いつかなくて」
[p]
#抹茶エクレア
「あの新しい商品、たしかに売れたで」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「でも、いつもの抹茶エクレアは？」
[p]
#主人公
「……」
[p]
#抹茶エクレア
「Komorebiに来たら食べられた、あの味は？」
[p]
#主人公
「……今は、ない」
[p]
#抹茶エクレア
「世界に届けようとしたのに」
[p]
#抹茶エクレア
「ウチらの店から、消えてもうたな」
[p]
[skipstop]
[eval exp="sf.cg_october_mini_01 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[image layer="1" name="october_sdcg_image" folder="bgimage" storage="cg/october/SD10_01_Bad010_Overseas_But_Gone.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="october_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="october_sdcg_image"]
[free layer="1" name="october_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "CORE", "id": "010", "title": "世界には売れた。店から消えた。", "lesson": "「世界に届ける」と「自分たちの店をなくす」は同じではなかった。", "retry": "*choice_10_01", "storage": "n10_october.ks", "month": "10"};
[endscript]
[register_core_bad id="010"]
[call storage="system_common.ks" target="*show_core_bad"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
[jump target="*choice_10_01"]

*bad011_entry
[if exp="sf.core_bad_011 === true"]
[cm]
#
その結末は、もう知っている。
[p]
[jump target="*choice_10_01"]
[endif]
[jump target="*bad_10_011"]

*bad_10_011
[eval exp="f.chapter = '10'; f.scene = '10_bad011'"]
[cm]
[xchgbgm storage="02_Flour_on_the_Floor.mp3" time="900"]
#主人公
「本物なら、説明しなくても伝わるはず」
[p]
#抹茶エクレア
「せや！　食べたら分かる！」
[p]
#主人公
「いつもの商品写真と、日本語の説明だけ送ろう」
[p]
#抹茶エクレア
「中身は一切変えへん」
[p]
#主人公
「うん。それだけで十分だと思う」
[p]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
#主人公
「……返事が来た」
[p]
#抹茶エクレア
「どうやった？」
[p]
#主人公
「“紹介したい気持ちはあるが、商品の特徴や保管条件が分からないため、今回は見送りたい”って」
[p]
#抹茶エクレア
「えっ！？」
[p]
#主人公
「来日予定の担当者にも、詳しい案内を渡せなかった」
[p]
#抹茶エクレア
「見たら分かるやん！」
[p]
#主人公
「見る前に知りたい人もいるよ」
[p]
#抹茶エクレア
「食べたら分かるやん！」
[p]
#主人公
「食べる前に、原材料や保存方法を確認しないと選べない人もいる」
[p]
#抹茶エクレア
「……」
[p]
#主人公
「味を変えなくていいことと、何も伝えなくていいことは別だったんだね」
[p]
#抹茶エクレア
「……おいしいのに」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ちゃんと、おいしいのに」
[p]
#主人公
「届く前に止まっちゃった」
[p]
#抹茶エクレア
「……」
[p]
#抹茶エクレア
「神田ちゃんに、笑われるな」
[p]
#主人公
「なんで神田さん？」
[p]
#抹茶エクレア
「……ウチ、説明するん下手やった」
[p]
[skipstop]
[eval exp="sf.cg_october_mini_02 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[image layer="1" name="october_sdcg_image" folder="bgimage" storage="cg/october/SD10_02_Bad011_Not_Communicated.png" x="320" y="100" width="640" height="360" visible="true"]
[image layer="1" name="october_sdcg_frame" folder="image" storage="april_ui/v4/sdcg_window_frame.png" x="310" y="90" width="660" height="380" visible="true"]
#
[p]
[free layer="1" name="october_sdcg_image"]
[free layer="1" name="october_sdcg_frame"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[iscript]
f.april_bad = {"kind": "CORE", "id": "011", "title": "伝わらなければ届かない", "lesson": "いいものでも、届かなければ知ってもらえない。", "retry": "*choice_10_01", "storage": "n10_october.ks", "month": "10"};
[endscript]
[register_core_bad id="011"]
[call storage="system_common.ks" target="*show_core_bad"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_morning.png" time="0"]
[xchgbgm storage="05_Morning_Mise_en_Place.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
[jump target="*choice_10_01"]

*correct_10
[eval exp="f.chapter = '10'; f.scene = '10_correct'"]
[cm]
#主人公
「味は守って、伝え方と届け方を工夫しよう」
[p]
#抹茶エクレア
「変えるん？　変えへんの？」
[p]
#主人公
「商品は簡単に変えない。でも、知らない人に伝える言葉は変える」
[p]
#抹茶エクレア
「……なるほど」
[p]
#主人公
「冷たいお菓子だから、海外へ送るには保管や輸送の準備も必要だし」
[p]
#抹茶エクレア
「いきなり大量に売るんやなくて？」
[p]
#主人公
「まずは来日する担当者に食べてもらおう。その先は条件を確かめてから」
[p]
#抹茶エクレア
「小さく始めるんやな」
[p]
#主人公
「うん。いつもの店を止めない範囲で」
[p]
#抹茶エクレア
「それ、ええな」
[p]
#主人公
「試食の説明、考えてみよう」
[p]
#抹茶エクレア
「抹茶の香りがして、ちょっとほろ苦くて」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「外は生地、中はクリーム」
[p]
#主人公
「そうそう」
[p]
#抹茶エクレア
「……聞いたことない人にも、分かるかな」
[p]
#主人公
「試してみよう」
[p]

*scene_10_05
[eval exp="f.chapter = '10'; f.scene = '10_05'"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
#抹茶エクレア
「英語にしたらええんやんな」
[p]
#主人公
「言語だけじゃなくて、何を伝えるかも大事かな」
[p]
#抹茶エクレア
「抹茶エクレア」
[p]
#主人公
「まず、それが何か」
[p]
#抹茶エクレア
「お茶の味がする、細長いお菓子」
[p]
#主人公
「もう少しだけ詳しく」
[p]
#抹茶エクレア
「シュー生地の中に、抹茶クリーム」
[p]
#主人公
「いいね」
[p]
[skipstop]
[eval exp="sf.cg_october_event_02 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="cg/october/CG10_02_Words_for_a_New_World.png" time="500"]
#抹茶エクレア
「甘い。でも、あとからちょっとほろ苦い」
[p]
#主人公
「それ、抹茶ちゃんが最初に説明してくれた言葉だね」
[p]
#抹茶エクレア
「そやった？」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「ほなウチ、最初から正解知ってたんや」
[p]
#主人公
「言葉にできたのは今日だけどね」
[p]
#抹茶エクレア
「細かいなあ」
[p]
#主人公
「あと、原材料とアレルギー情報。これはレシピと照らして正確に書こう」
[p]
#抹茶エクレア
「食べられへんもんがある人もおるしな」
[p]
#主人公
「保存方法と、持ち歩ける時間の案内も」
[p]
#抹茶エクレア
「世界一目指す前に、案内一枚からやな」
[p]
#主人公
「一枚でも、必要な人には大事だから」
[p]
#抹茶エクレア
「……うん」
[p]
#抹茶エクレア
「これで、海の向こうの人にも伝わるかな」
[p]
#主人公
「少なくとも、最初の一歩にはなると思う」
[p]

*scene_10_06
[eval exp="f.chapter = '10'; f.scene = '10_06'"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
[playse storage="se_shop_door_chime.wav" volume="75" loop="false"]
#担当者
「Hello. Thank you for having me.」
[p]
#抹茶エクレア
「……なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「ウチ、英語ぺらぺらちゃうで」
[p]
#主人公
「知ってる」
[p]
#抹茶エクレア
「大丈夫？」
[p]
#主人公
「準備した言葉があるから」
[p]
[skipstop]
[eval exp="sf.cg_october_event_03 = true"]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="cg/october/CG10_03_A_Taste_Beyond_the_Sea.png" time="500"]
#担当者
「Oh… a little bitter, then sweet. I like it.」
[p]
#主人公
「……美味しいって」
[p]
#抹茶エクレア
「そこは顔で分かった！」
[p]
#担当者
「Is this the same one you sell every day?」
[p]
#主人公
「はい。普段、店で出しているものです」
[p]
#抹茶エクレア
「いつものエクレアやで」
[p]
#担当者
「Good. That's exactly what I wanted to know.」
[p]
#抹茶エクレア
「……通じた？」
[p]
#主人公
「うん。少なくとも、ちゃんと伝わったみたい」
[p]
#抹茶エクレア
「良かった……」
[p]
#主人公
「緊張してた？」
[p]
#抹茶エクレア
「してへん！」
[p]
#主人公
「そう？」
[p]
#抹茶エクレア
「……ちょっとだけ」
[p]
#主人公
「ちょっとね」
[p]
#抹茶エクレア
「でも、世界って」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「こうやって一人ずつ、つながっていくんやな」
[p]

*scene_10_07
[eval exp="f.chapter = '10'; f.scene = '10_07'"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_day.png" time="0"]
[chara_mod name="抹茶エクレア" face="default"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
[playse storage="se_shop_door_chime.wav" volume="75" loop="false"]
[chara_mod name="藤代誠" face="normal"]
[chara_show name="藤代誠" left="120" top="90" time="250"]
#藤代誠
「こんばんは」
[p]
#主人公
「いらっしゃいませ。」
[p]
#抹茶エクレア
「また来てくれたんや！」
[p]
#藤代誠
「約束しましたから」
[p]
#抹茶エクレア
「……！」
[p]
#主人公
「八月の『また来ます』だね」
[p]
#藤代誠
「今日もひとつ、お願いします」
[p]
#藤代誠
「……説明、増えましたね」
[p]
#主人公
「海外からの問い合わせがあって」
[p]
#藤代誠
「そうですか」
[p]
#抹茶エクレア
「でも、味は変えてへんで」
[p]
#藤代誠
「そうでしょうね」
[p]
#藤代誠
「……いつもの味ですね」
[p]
#抹茶エクレア
「せやろ！」
[p]
#藤代誠
「前より、初めて来る人に優しい店になった気がします」
[p]
#主人公
「……ありがとうございます」
[p]
#藤代誠
「いいえ。ごちそうさまです」
[p]
[chara_hide name="藤代誠" time="300"]
[playse storage="se_shop_door_chime.wav" volume="75" loop="false"]
#抹茶エクレア
「……あの人、やっぱちょっと不思議やな」
[p]
#主人公
「そう？」
[p]
#抹茶エクレア
「言葉少ないのに、よう見てる」
[p]
#主人公
「そうだね」
[p]

*scene_10_08
[eval exp="f.chapter = '10'; f.scene = '10_08'"]
[mask time="550" color="0x000000"]
[cm]
[chara_hide name="抹茶エクレア" time="0"]
[chara_hide name="三好文子" time="0"]
[chara_hide name="神田姫花" time="0"]
[chara_hide name="久世玲" time="0"]
[chara_hide name="藤代誠" time="0"]
[bg storage="apr_shop_morning.png" time="0"]
[xchgbgm storage="06_One_Year_One_Eclair.mp3" time="900"]
[chara_mod name="抹茶エクレア" face="quiet"]
[chara_show name="抹茶エクレア" left="790" top="90" time="250"]
[mask_off time="550"]
#主人公
「海外の企画、最初の紹介記事が出たらしい」
[p]
#抹茶エクレア
「ほんま！？」
[p]
#主人公
「うん。小さな記事だけど」
[p]
#抹茶エクレア
「小さくても、海の向こうや」
[p]
#主人公
「まだ大量注文が決まったわけじゃないよ」
[p]
#抹茶エクレア
「分かってる。店も普通に開けなあかん」
[p]
#主人公
「それを忘れなかったのがよかったと思う」
[p]
#抹茶エクレア
「なあ」
[p]
#主人公
「何？」
[p]
#抹茶エクレア
「ウチ、世界一になりたいねん」
[p]
#主人公
「知ってる」
[p]
#抹茶エクレア
「でも世界って、知らん人ばっかりやな」
[p]
#主人公
「そりゃそうだね」
[p]
#抹茶エクレア
「知らん人に、知らん味を届けるんって」
[p]
#抹茶エクレア
「思ってたより、ちゃんとせなあかんこと多いな」
[p]
#主人公
「うん」
[p]
#抹茶エクレア
「世界一って、何やろな」
[p]
#主人公
「……今は、まだ分からないね」
[p]
#抹茶エクレア
「でも、今日も店は開ける」
[p]
#主人公
「そうだね」
[p]
#抹茶エクレア
「海の向こうでも、こっちでも」
[p]
#抹茶エクレア
「食べてくれる一人がおるなら」
[p]
#抹茶エクレア
「ウチ、ちゃんと作りたいわ」
[p]
#主人公
「うちの店でね」
[p]
#抹茶エクレア
「うん。Komorebiで」
[p]
#抹茶エクレア
「……で、今日の仕込み、何個？」
[p]
#主人公
「いつもどおり」
[p]
#抹茶エクレア
「千個？」
[p]
#主人公
「もう忘れて」
[p]
#抹茶エクレア
「覚えやすい数字やからなあ」
[p]

*october_clear
[iscript]
sf.normal_ch10_clear = true; f.chapter = "10"; f.scene = "clear"; f.current_clear_month = "10";
[endscript]
[skipstop]
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
10月 CLEAR『海の向こうへ、いつもの味』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
初めて、海の向こうの人へKomorebiの抹茶エクレアを説明した。
[p]
知っている人には当たり前の味も、初めての人には、言葉も案内も必要だった。
[r]
伝え方は変えた。けれど、毎日店で作る味は変えなかった。
[p]
十月に覚えたのは、遠くへ届けるためにも、帰ってこられる店を残すことだった。
[p]
[jump target="*october_clear_menu"]

*october_clear_menu
[clearstack stack="if"]
[cm]
[tb_show_message_window]
[deffont color="0x3B2A1B" bold="true" size="28"]
[resetfont]
#
[font color="0x305332" bold="true" size="28"]
10月 CLEAR『海の向こうへ、いつもの味』
[font color="0x3B2A1B" bold="true" size="28"]
[r]
抹茶ちゃんのひとこと
[r]
「世界って遠いけど、まずは目の前の一人からなんやな」
[resetfont]
[glink text="タイトルへ" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="150" bold="true" storage="title_screen.ks" target="*title" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="記録" color="green" font_color="0x3B2A1B" x="675" width="400" height="85" size="23" y="245" bold="true" storage="system_common.ks" target="*records_from_clear" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[glink text="11月へ" color="green" font_color="0x3B2A1B" x="675" y="340" width="400" height="85" size="23" bold="true" storage="n11_november.ks" target="*eyecatch_10_11" graphic="april_ui/v2/choices/choice_normal.png" enterimg="april_ui/v2/choices/choice_hover.png" name="april_action"]
[s]
