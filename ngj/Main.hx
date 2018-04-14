package ngj;
import h2d.Bitmap;
import h2d.Tile;
import hxd.App;
import hxd.res.Sound;
import ngj.ui.SimpleUI;
/**
 * ...
 * @author AS
 */
class Main extends App
{
	var bmp:Bitmap;
	var fui : h2d.Flow; //for UI

	override function init() 
	{
		hxd.Res.initEmbed();
		
		var tile:Tile = hxd.Res.testLogo.toTile(); //ładowanie png
		tile = tile.center();
		bmp = new h2d.Bitmap(tile, s2d);
		bmp.x = s2d.width * 0.5;
		bmp.y = s2d.height * 0.5;
		
		fui = new h2d.Flow(s2d);
		fui.isVertical = true;
		fui.verticalSpacing = 5;
		fui.padding = 10;
		var simpleUI = new SimpleUI(fui);
		simpleUI.addText("nie twierdze, ze to ma jakis duzy sens ale costam sie wyswietla");
		simpleUI.addButton("tu nacisnij", function() {hxd.Res.push.play(); });
	}
	
	override function update(dt:Float) 
	{
		bmp.rotation += 0.01;
	}
	
	static function main() 
	{
		new Main();
	}
	
}
