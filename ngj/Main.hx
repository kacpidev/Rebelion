package ngj;
import h2d.Bitmap;
import hxd.App;
import ngj.ui.SimpleUI;
/**
 * ...
 * @author AS
 */
class Main extends App
{
	var bmp:Bitmap;
	var fui : h2d.Flow;
	
	var simpleUI:SimpleUI;
	
	override function init() 
	{
		var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
		bmp = new h2d.Bitmap(tile, s2d);
		bmp.x = s2d.width * 0.5;
		bmp.y = s2d.height * 0.5;
		
		fui = new h2d.Flow(s2d);
		fui.isVertical = true;
		fui.verticalSpacing = 5;
		fui.padding = 10;
		simpleUI = new SimpleUI(fui);
		simpleUI.addText("nie twierdze, ze to ma jakis duzy sens ale costam sie wyswietla");
		simpleUI.addButton("tu nacisnij", function() {simpleUI.addCheck("uiuiuiuiuiuiui", function() {return true; }, function(b:Bool) { }); });
	}
	
	override function update(dt:Float) 
	{
		bmp.rotation += 0.1;
	}
	
	static function main() 
	{
		new Main();
	}
	
}
