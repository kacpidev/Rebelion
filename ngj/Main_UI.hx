package ngj;

import h2d.Sprite;
import hxd.res.Sound;
import ngj.ui.SimpleUI;
/**
 * ...
 * @author AS
 */
class Main_UI 
{
	public static var instance(default, null):Main_UI = new Main_UI();

	var fui : h2d.Flow; //for UI
	var s2d:Sprite;
	
	function new ()
	{
		
	}
	
	public function buildUI(s2d)
	{
		fui = new h2d.Flow(s2d);
		fui.isVertical = true;
		fui.verticalSpacing = 5;
		fui.padding = 10;
		var simpleUI = new SimpleUI(fui);
		simpleUI.addText("nie twierdze, ze to ma jakis duzy sens ale costam sie wyswietla");
		simpleUI.addButton("tu nacisnij", function() {hxd.Res.push.play(); });
	}
	
	public function update(dt:Float) 
	{
		
	}
}
