package ngj;

import h2d.Bitmap;
import h2d.Layers;
import h2d.Tile;
/**
 * ...
 * @author AS
 */
class Main_gfx 
{
	public static var instance(default, null):Main_gfx = new Main_gfx();

	var bmp:Bitmap;
		
	function new ()
	{
		
	}
	public function init(s2d:Dynamic)
	{
		var tile:Tile = hxd.Res.testLogo.toTile(); //ładowanie png
		tile = tile.center();
		bmp = new h2d.Bitmap(tile, s2d);
		bmp.x = s2d.width * 0.5;
		bmp.y = s2d.height * 0.5;
	}
	
	public function update(dt:Float) 
	{
		bmp.rotation += 0.01;
	}
	
}
