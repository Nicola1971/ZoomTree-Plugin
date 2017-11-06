/**
 * ZoomTree
 *
 * Zoom evolution resource tree
 *
 * @author    Nicola Lambathakis http://www.tattoocms.it/
 * @category    plugin
 * @version    1
 * @license	 http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal    @events OnManagerTreePrerender
 * @internal    @installset base
 * @internal    @modx_category Admin
 **/
// run event
$e = &$modx->Event;
$output ='';
switch($e->name) {
case 'OnManagerTreePrerender':
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
        $('.textsize').html(TfontSize + 'em');
    }
$('input.rangeTree').on('change', function () {
    var v = $(this).val();
    $('#treeRoot').css('font-size', v + 'em')
	//$('#treeRoot').css('line-height', v + 'em')
    $('.textsize').html(v + 'em');
    // Save the color in local storage
    TfontSize = $(this).val();
    localStorage.setItem('my_evo_TfontSize', TfontSize);
});
});
    ////close document ready
</script>
<style>
	.treerange {
	position: absolute;
	left: 5px;
    bottom: -5px;
	height:40px;
	width:100%;
	cursor: pinter;
	z-index:999999;
	opacity:0.5;
	transition: all;
	-webkit-transition-duration: 1s; /* Safari */
    transition-duration: 1s;}
	.treerange:hover {
	opacity:1;}
	</style>	
	<div class=\"treerange text-center\"><input class=\"rangeTree\" type=\"range\" value=\"1\" min=\"1\" max=\"2\" step=\"0.001\"><!--<span class=\"textsize\"></span>--></div>
	";
    break;
}
$e->output($output);
return;
?>