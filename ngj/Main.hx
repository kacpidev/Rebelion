package ngj;

import hxd.App;

/**
 * ...
 * @author AS
 */
class Main extends App
{

	override function init() 
	{
		hxd.Res.initEmbed();
		
		Main_gfx.instance.init(s2d);
		Main_UI.instance.buildUI(s2d);
	}
	
	override function update(dt:Float) 
	{
		Main_UI.instance.update(dt);
		Main_gfx.instance.update(dt);
	}
	
	static function main() 
	{
		new Main();
	}
	
}
