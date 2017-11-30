/**
 * ZoomTree
 *
 * Zoom evolution resource tree
 *
 * @author    Nicola Lambathakis http://www.tattoocms.it/
 * @category    plugin
 * @version    1.3.1
 * @license	 http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @events OnManagerTreePrerender
 * @internal    @properties &zoomElements= Zoom Elements In Tree :;list;yes,no;no &HideHscroll= Disable horizontal scrollbar :;list;yes,no;yes &minVal= Min value of range:;string;1 &maxVal= Max value of range:;string;2 &rVal= Value of range:;string;1 &Step= Range step:;string;0.001 &showResetButton= Show Reset Button:;list;yes,no;yes &showSize= Show Font Size:;list;yes,no;no &marginBottom= Margin from Bottom:;string;20px
 * @internal    @installset base
 * @internal    @modx_category Admin
 **/
// run event
$e = &$modx->Event;
$output ='';
switch($e->name) {
case 'OnManagerTreePrerender':
$minVal = isset($minVal) ? $minVal : '1';
$maxVal = isset($maxVal) ? $maxVal : '2';
$rVal = isset($rVal) ? $rVal : '1';
$Step = isset($Step) ? $Step : '0.001';
$marginBottom = isset($marginBottom) ? $marginBottom : '20px';
$ResetButton = '';	
if ($showResetButton == yes) {
$ResetButton = '<a href="javascript:;" onclick="cleanLocalStorageReloadAll(\'my_evo_TfontSize\')" class="resetTree"><i class="fa fa-refresh"></i></a>';
}
if ($showSize == yes) {
$TextSize = '<span class="textsize"></span>';
}
if ($HideHscroll == yes) {
$HideScroll = '#treeHolder, .ElementsInTree #tree .tab-page .panel-group .panel, .ElementsInTree #tree #tabDoc.tab-page>div {overflow-x: hidden!important;}
a.node{overflow-x: hidden; text-overflow: ellipsis;}';
}
if ($zoomElements == yes) {
$SetElements = "
		$('#tabTemp').css('font-size', TfontSize + 'em')
		$('#tabTV').css('font-size', TfontSize + 'em')
		$('#tabCH').css('font-size', TfontSize + 'em')
		$('#tabSN').css('font-size', TfontSize + 'em')
		$('#tabPL').css('font-size', TfontSize + 'em')
		$('#tabMD').css('font-size', TfontSize + 'em')";
$loadElements = "
	    $('#tabTemp').css('font-size', v + 'em')
	    $('#tabTV').css('font-size', v + 'em')
	    $('#tabCH').css('font-size', v + 'em')
	    $('#tabSN').css('font-size', v + 'em')
	    $('#tabPL').css('font-size', v + 'em')
	    $('#tabMD').css('font-size', v + 'em')";
}

$output = "
<script>
jQuery(document).ready(function($) {
     var TfontSize;
    // Get text size
    var my_evo_TfontSize = localStorage.getItem('my_evo_TfontSize');
    if (my_evo_TfontSize) {
        TfontSize = my_evo_TfontSize;
        setTfontSize(TfontSize);
    }
    function setTfontSize(TfontSize) {
        $('#treeRoot').css('font-size', TfontSize + 'em')
        $SetElements
        $('.textsize').html(TfontSize + 'em');
		$('.rangeTree').val(TfontSize);
    }
$('input.rangeTree').on('change', function () {
    var v = $(this).val();
    $('#treeRoot').css('font-size', v + 'em')
    $loadElements
    $('.textsize').html(v + 'em');
    // Save the color in local storage
    TfontSize = $(this).val();
    localStorage.setItem('my_evo_TfontSize', TfontSize);
});
});
//clear Local Storage and reload all frames
function cleanLocalStorageReloadAll(keys) {
    keys = keys.split(',');
    for (var i = 0; i < keys.length; i++) {
        delete localStorage[keys[i]];
    }
    location.reload();
}
</script>
<style>
input.rangeTree {cursor: pointer;}
	.treerange {
	position: absolute;
	left: 10px;
    bottom: $marginBottom;
	height:40px;
	width:90%;
	z-index:999999;
	opacity:0.5;
	transition: all;
	-webkit-transition-duration: 2s; /* Safari */
    transition-duration: 2s;}
	.treerange:hover {
	opacity:1;}
	.resetTree {font-size:10px;display:inline-block;vertical-align:top;padding:3px 6px;}
	.textsize {font-size:11px;display:inline-block;vertical-align:top;padding:3px 0;}
	
	$HideScroll
  	</style>	
	<div class=\"treerange text-center\"><input class=\"rangeTree\" type=\"range\" value=\"$rVal\" min=\"$minVal\" max=\"$maxVal\" step=\"$Step\" onchange=\"console.log(this.value)\"> $ResetButton $TextSize</div>
	";
    break;
}
$e->output($output);
return;
?>