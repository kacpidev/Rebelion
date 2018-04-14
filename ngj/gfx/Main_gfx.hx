package ngj.gfx;

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

	var bckg_layer1_bmp:Bitmap;
	var bckg_layer2_bmp:Bitmap;
	var bckg_layer3_bmp:Bitmap;
	var bckg_layer4_bmp:Bitmap;
	var bckg_layer5_bmp:Bitmap;

	function new ()
	{
		
	}

	public function init(s2d:Dynamic)
	{
		var scale = Math.min(1150.0, s2d.width) / 1150.0;

		var bckgLayer1:Layers = new h2d.Layers(s2d);
		var bckgLayer2:Layers = new h2d.Layers(s2d);
		var bckgLayer2Fog:Layers = new h2d.Layers(s2d);
		var bckgLayer3:Layers = new h2d.Layers(s2d);
		var bckgLayer3Fog:Layers = new h2d.Layers(s2d);
		var bckgLayer4:Layers = new h2d.Layers(s2d);
		var bckgLayer4Fog:Layers = new h2d.Layers(s2d);
		var bckgLayer5:Layers = new h2d.Layers(s2d);
		var bckgLayer5Fog:Layers = new h2d.Layers(s2d);

		var bckg_1:Tile = hxd.Res.Woods_bckg.toTile();
		var bckg_2:Tile = hxd.Res.Woods_trees_bckg.toTile();
		var bckg_3:Tile = hxd.Res.Woods_dark_trees_bckg.toTile();
		var bckg_4:Tile = hxd.Res.Woods_blue_tree.toTile();
		var bckg_5:Tile = hxd.Res.Woods_front_trees.toTile();
		
		bckg_layer1_bmp = new h2d.Bitmap(bckg_1, bckgLayer1);
		bckg_layer2_bmp = new h2d.Bitmap(bckg_2, bckgLayer2);
		bckg_layer3_bmp = new h2d.Bitmap(bckg_3, bckgLayer3);
		bckg_layer4_bmp = new h2d.Bitmap(bckg_4, bckgLayer4);
		bckg_layer5_bmp = new h2d.Bitmap(bckg_5, bckgLayer5);
	
		bckg_layer1_bmp.setScale(scale);
		bckg_layer1_bmp.x = s2d.width / 2 - bckg_1.width/2 * scale;
		bckg_layer1_bmp.y = 0;

		bckg_layer2_bmp.setScale(scale);
		bckg_layer2_bmp.x = s2d.width / 2 - bckg_1.width/2 * scale;
		bckg_layer2_bmp.y = 0;

		bckg_layer3_bmp.setScale(scale);
		bckg_layer3_bmp.x = s2d.width / 2 - bckg_1.width/2 * scale;
		bckg_layer3_bmp.y = 0;

		bckg_layer4_bmp.setScale(scale);
		bckg_layer4_bmp.x = s2d.width / 2 - bckg_1.width/2 * scale;
		bckg_layer4_bmp.y = 0;

		bckg_layer5_bmp.setScale(scale);
		bckg_layer5_bmp.x = s2d.width / 2 - bckg_1.width/2 * scale;
		bckg_layer5_bmp.y = 0;

		var partTest = new h2d.Particles();
	}
	

	public function update(dt:Float) 
	{
	}
}
