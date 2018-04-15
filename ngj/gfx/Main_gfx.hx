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

	var xPosition:Float;
	var scale:Float;

	var bckg_layer1_bmp:Bitmap;
	var bckg_layer2_bmp:Bitmap;
	var bckg_layer3_bmp:Bitmap;
	var bckg_layer4_bmp:Bitmap;
	var bckg_layer5_bmp:Bitmap;
	var bckg_fog2_bmp:Bitmap;
	var bckg_fog2_bmp_2:Bitmap;
	var bckg_fog3_bmp:Bitmap;
	var bckg_fog3_bmp_2:Bitmap;
	var bckg_fog4_bmp:Bitmap;
	var bckg_fog4_bmp_2:Bitmap;
	var bckg_fog5_bmp:Bitmap;
	var bckg_fog5_bmp_2:Bitmap;

	var fog2:Float;
	var fog3:Float;
	var fog4:Float;
	var fog5:Float;

	function new ()
	{
		fog2 = Math.random() * 100;
		fog3 = Math.random() * 100;
		fog4 = Math.random() * 100;
		fog5 = Math.random() * 100;
	}

	public function init(s2d:Dynamic)
	{
		scale = Math.min(1150.0, s2d.width) / 1150.0;

		var bckgLayer1:Layers = new h2d.Layers(s2d);
		var bckgLayer2:Layers = new h2d.Layers(s2d);
		var bckgLayer2Fog:Layers = new h2d.Layers(s2d);
		var bckgLayer3:Layers = new h2d.Layers(s2d);
		var bckgLayer3Fog:Layers = new h2d.Layers(s2d);
		var bckgLayer4:Layers = new h2d.Layers(s2d);
		var bckgLayer4Fog:Layers = new h2d.Layers(s2d);
		var bckgLayer5:Layers = new h2d.Layers(s2d);
		var bckgLayer5Fog:Layers = new h2d.Layers(s2d);
		var maskLayer:Layers = new h2d.Layers(s2d);


		var bckg_1:Tile = hxd.Res.Woods_bckg.toTile();
		var bckg_2:Tile = hxd.Res.Woods_trees_bckg.toTile();
		var bckg_3:Tile = hxd.Res.Woods_dark_trees_bckg.toTile();
		var bckg_4:Tile = hxd.Res.Woods_blue_tree.toTile();
		var bckg_5:Tile = hxd.Res.Woods_front_trees.toTile();
		
		var fog1:Tile = hxd.Res.Fog.toTile();

		var mask:Tile = hxd.Res.mask.toTile();

		bckg_layer1_bmp = new h2d.Bitmap(bckg_1, bckgLayer2);
		bckg_layer2_bmp = new h2d.Bitmap(bckg_2, bckgLayer2);
		bckg_layer3_bmp = new h2d.Bitmap(bckg_3, bckgLayer3);
		bckg_layer4_bmp = new h2d.Bitmap(bckg_4, bckgLayer4);
		bckg_layer5_bmp = new h2d.Bitmap(bckg_5, bckgLayer5);

		bckg_fog2_bmp = new h2d.Bitmap(fog1, bckgLayer2Fog);
		bckg_fog2_bmp_2 = new h2d.Bitmap(fog1, bckgLayer2Fog);
		bckg_fog2_bmp.blendMode = h2d.BlendMode.Add;
		bckg_fog2_bmp_2.blendMode = h2d.BlendMode.Add;
		bckg_fog3_bmp = new h2d.Bitmap(fog1, bckgLayer3Fog);
		bckg_fog3_bmp_2 = new h2d.Bitmap(fog1, bckgLayer3Fog);
		bckg_fog3_bmp.blendMode = h2d.BlendMode.Add;		
		bckg_fog3_bmp_2.blendMode = h2d.BlendMode.Add;		
		bckg_fog4_bmp = new h2d.Bitmap(fog1, bckgLayer4Fog);
		bckg_fog4_bmp_2 = new h2d.Bitmap(fog1, bckgLayer4Fog);
		bckg_fog4_bmp.blendMode = h2d.BlendMode.Add;		
		bckg_fog4_bmp_2.blendMode = h2d.BlendMode.Add;		
		bckg_fog5_bmp = new h2d.Bitmap(fog1, bckgLayer5Fog);
		bckg_fog5_bmp_2 = new h2d.Bitmap(fog1, bckgLayer5Fog);
		bckg_fog5_bmp.blendMode = h2d.BlendMode.Add;
		bckg_fog5_bmp_2.blendMode = h2d.BlendMode.Add;

		xPosition = s2d.width / 2 - bckg_1.width/2 * scale;

		bckg_layer1_bmp.setScale(scale);
		bckg_layer1_bmp.x = xPosition;
		bckg_layer1_bmp.y = 0;

		bckg_layer2_bmp.setScale(scale);
		bckg_layer2_bmp.x = xPosition;
		bckg_layer2_bmp.y = 0;

		bckg_layer3_bmp.setScale(scale);
		bckg_layer3_bmp.x = xPosition;
		bckg_layer3_bmp.y = 0;

		bckg_layer4_bmp.setScale(scale);
		bckg_layer4_bmp.x = xPosition;
		bckg_layer4_bmp.y = 0;

		bckg_layer5_bmp.setScale(scale);
		bckg_layer5_bmp.x = xPosition;
		bckg_layer5_bmp.y = 0;

		bckg_fog2_bmp.setScale(scale);
		bckg_fog2_bmp.x = xPosition + bckg_1.width * scale * fog2 / 100.0;
		bckg_fog2_bmp.y = -90 * scale;

		bckg_fog3_bmp.setScale(scale);
		bckg_fog3_bmp.x = xPosition + bckg_1.width * scale * fog3 / 100.0;
		bckg_fog3_bmp.y = -50 * scale;

		bckg_fog4_bmp.setScale(scale);
		bckg_fog4_bmp.x = xPosition + bckg_1.width * scale * fog4 / 100.0;
		bckg_fog4_bmp.y = -30 * scale;

		bckg_fog5_bmp.setScale(scale);
		bckg_fog5_bmp.x = xPosition + bckg_1.width * scale * fog5 / 100.0;
		bckg_fog5_bmp.y = 0;

		bckg_fog2_bmp_2.setScale(scale);
		bckg_fog2_bmp_2.x = xPosition - bckg_1.width * scale * (100 - fog2) / 100.0;
		bckg_fog2_bmp_2.y = -90 * scale;

		bckg_fog3_bmp_2.setScale(scale);
		bckg_fog3_bmp_2.x = xPosition - bckg_1.width * scale * (100 - fog3) / 100.0;
		bckg_fog3_bmp_2.y = -50 * scale;

		bckg_fog4_bmp_2.setScale(scale);
		bckg_fog4_bmp_2.x = xPosition - bckg_1.width * scale * (100 - fog4) / 100.0;
		bckg_fog4_bmp_2.y = -30 * scale;

		bckg_fog5_bmp_2.setScale(scale);
		bckg_fog5_bmp_2.x = xPosition - bckg_1.width * scale * (100 - fog5) / 100.0;
		bckg_fog5_bmp_2.y = 0;

		var visibilityMask = new h2d.Bitmap(mask, maskLayer);
		visibilityMask.blendMode = h2d.BlendMode.Multiply;
		visibilityMask.setScale(scale);
		visibilityMask.y = 0;		
		visibilityMask.x = s2d.width / 2 - bckg_1.width * scale;
	}
	

	public function update(dt:Float) 
	{
		fog2 += dt * 0.01;
		fog3 -= dt * 0.012;
		fog4 += dt * 0.015;
		fog5 -= dt * 0.02;

		if (fog2 > 100.0) fog2 -= 100.0;
		if (fog3 < 0.0) fog3 += 100.0;
		if (fog4 > 100.0) fog4 -= 100.0;
		if (fog5 < 0.0) fog5 += 100.0;

		var width = 1150;

		bckg_fog2_bmp.x = xPosition + width * scale * fog2 / 100.0;
		bckg_fog3_bmp.x = xPosition + width * scale * fog3 / 100.0;
		bckg_fog4_bmp.x = xPosition + width * scale * fog4 / 100.0;
		bckg_fog5_bmp.x = xPosition + width * scale * fog5 / 100.0;
		bckg_fog2_bmp_2.x = xPosition - width * scale * (100 - fog2) / 100.0;
		bckg_fog3_bmp_2.x = xPosition - width * scale * (100 - fog3) / 100.0;
		bckg_fog4_bmp_2.x = xPosition - width * scale * (100 - fog4) / 100.0;
		bckg_fog5_bmp_2.x = xPosition - width * scale * (100 - fog5) / 100.0;
	}
}
