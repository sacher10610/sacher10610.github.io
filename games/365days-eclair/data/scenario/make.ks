;このファイルは削除しないでください！
;
;make.ks はデータをロードした時に呼ばれる特別なKSファイルです。
;Fixレイヤーの初期化など、ロード時点で再構築したい処理をこちらに記述してください。
;
;
;
;return 必須
; 4月最初の選択肢をロードした場合、現在のsfからLEARNEDを再判定する。
; 物語の途中やBAD画面のセーブは、そのまま標準処理で復元する。
[iscript]
$(".april_ui").each(function () {
    var pm = JSON.parse($(this).attr("data-event-pm"));
    $(this).attr({title: pm.hint, alt: pm.hint});
});
var frame = TG.getStack("call");
var options = TG.layer.getFreeLayer().find('[data-event-tag="glink"]');
var isProductionChoice = options.toArray().some(function (element) {
    var pm = JSON.parse($(element).attr("data-event-pm"));
    return pm.target === "*choice_04_a";
});
if (frame && frame.storage === "n04_april.ks" && isProductionChoice) {
    var cached = TG.cache_scenario["./data/scenario/n04_april.ks"];
    frame.index = cached.map_label.choice_04_production.index;
    frame.auto_next = "yes";
    TG.cancelStrongStop();
}
[endscript]
[return]