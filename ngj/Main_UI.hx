package ngj;

import h2d.Flow;
import h2d.Sprite;
import h2d.Text;
import hxd.res.Sound;
import ngj.ui.SimpleUI;
/**
 * ...
 * @author AS
 */
class Main_UI 
{
	public static var instance(default, null):Main_UI = new Main_UI();

	//balance
	var scavengeTime:Float = 60*3;
	var foodPerScavenge:Float = 5;
	var materialsPerScavenge:Float = 5;
	var scavengeSpread:Float = 0.35;
	var manpowerPerShelter:Float = 1;
	var shelterBaseCost:Float = 10;
	var warehouseBaseCost:Float = 100;
	var feedPeriod:Float = 120;
	var maxFoodBase:Float = 200;
	var maxMaterialsBase:Float = 200;
	
	//control variables //potem trzeba to w init dodac
	var scavenging:Bool = false;
	var shelterCost:Float = 10;
	var shelterLevel:Float = 0;
	var warehouseCost:Float = 100;
	var warehouseLevel:Float = 0;
	var foodTimer:Float = 0;
	var maxFood:Float = 200;
	var maxMaterials:Float = 200;
	
	var leftBar : h2d.Flow;
	var scavengeButton:Flow;
	var scavTimerText:Text;
	var buildShelterButton:Flow;
	var buildShelterText:Text;
	var buildWarehouseButton:Flow;
	var buildWarehouseText:Text;
	
	var rightBar:Flow;
	var foodLabel:Text;
	var foodCount:Float = 0;
	var materialsLabel:Text;
	var materialsCount:Float = 0;
	var manpowerLabel:Text;
	var manpowerCount:Float = 0;
	
	var scavengeTimer:Float = 0;
	
	function new ()
	{
		
	}
	
	public function buildUI(s2d:Dynamic)
	{
		leftBar = new h2d.Flow(s2d);
		leftBar.isVertical = true;
		leftBar.verticalSpacing = 5;
		leftBar.padding = 10;
		leftBar.y = s2d.height / 2;
		
		rightBar = new h2d.Flow(s2d);
		rightBar.isVertical = true;
		rightBar.verticalSpacing = 5;
		rightBar.padding = 10;
		rightBar.y = s2d.height / 2;
		rightBar.x = s2d.width / 4;
		
		var buttonFlow:Flow = new Flow(leftBar);
		buttonFlow.horizontalSpacing = 5;
		//buttonFlow.paddingBottom = 7;
		scavengeButton = SimpleUI.addButton(buttonFlow, "SCAVENGE", onScavenge);
		scavTimerText = SimpleUI.addText(buttonFlow, '');
		
		var buttonFlow:Flow = new Flow(leftBar);
		buttonFlow.horizontalSpacing = 5;
		//buttonFlow.padding = 10;
		buildShelterButton = SimpleUI.addButton(buttonFlow, "BUILD SHELTER", function() {});
		buildShelterText = SimpleUI.addText(buttonFlow,  '$shelterCost');
		
		var buttonFlow:Flow = new Flow(leftBar);
		buttonFlow.horizontalSpacing = 5;
		//buttonFlow.padding = 10;
		buildWarehouseButton = SimpleUI.addButton(buttonFlow, "BUILD WAREHOUSE", function() {});
		buildWarehouseText = SimpleUI.addText(buttonFlow, '$warehouseCost');
		
		foodLabel = SimpleUI.addText(rightBar, 'Food: $foodCount');
		materialsLabel = SimpleUI.addText(rightBar, 'Materials: $materialsCount');
		manpowerLabel = SimpleUI.addText(rightBar, 'Rebeliants: $manpowerCount');
	}
	
	function onScavenge()
	{
		scavenging = true;
		scavengeTimer = scavengeTime;
	}
	
	function onShelterBuild()
	{
		manpowerCount += manpowerPerShelter;
		materialsCount -= shelterCost;
		shelterLevel += 1;
		shelterCost = shelterBaseCost * (shelterLevel + 1);
	}
	
	function onBuildWarehouse()
	{
		materialsCount -= warehouseCost;
		warehouseLevel += 1;
		maxFood = maxFoodBase * (warehouseLevel + 1);
		maxMaterials = maxMaterialsBase * (warehouseLevel + 1);
		warehouseCost = warehouseBaseCost * (warehouseLevel + 1);
	}
	
	function disableButton(button:Flow)
	{
		if (button == null) return;
		
		if (button.enableInteractive == true)
		{
			button.enableInteractive = false;
			button.backgroundTile = h2d.Tile.fromColor(0x101010);
		}
	}
	
	function enableButton(button:Flow, onClick:Void->Void)
	{
		if (button == null) return;
		
		if (button.enableInteractive == false)
		{
			button.backgroundTile = h2d.Tile.fromColor(0x404040);
			button.enableInteractive = true;
			button.interactive.cursor = Button;
			button.interactive.onClick = function(_) onClick();
			button.interactive.onOver = function(_) button.backgroundTile = h2d.Tile.fromColor(0x606060);
			button.interactive.onOut = function(_) button.backgroundTile = h2d.Tile.fromColor(0x404040);
		}
	}
	
	public function update(dt:Float) 
	{
		if (scavenging)
		{
			if (scavengeTimer > 0)
			{
				disableButton(scavengeButton);
				scavengeTimer -= dt;
				scavTimerText.text = '$scavengeTimer';
			}
			else
			{
				enableButton(scavengeButton,onScavenge);
				scavenging = false;
				var spread = (Math.random() * scavengeSpread) - scavengeSpread/2;
				foodCount += Math.round((foodPerScavenge * (manpowerCount+1))+ (spread * foodPerScavenge * (manpowerCount+1)));
				materialsCount +=Math.round((materialsPerScavenge * (manpowerCount+1)) - (spread * materialsPerScavenge * (manpowerCount+1)));
				scavTimerText.text = '';
			}
		}
		
		//building
		if (materialsCount < shelterCost)
		{
			disableButton(buildShelterButton);
		}
		else
		{
			enableButton(buildShelterButton, onShelterBuild);
		}
		
		if (materialsCount < warehouseCost)
		{
			disableButton(buildWarehouseButton);
		}
		else
		{
			enableButton(buildWarehouseButton, onBuildWarehouse);
		}
		
		
		if (foodCount > maxFood)
			foodCount = maxFood;
		if (materialsCount > maxMaterials)
			materialsCount = maxMaterials;
		
		if (foodTimer < feedPeriod)
		{
			foodCount -= manpowerCount;
			foodTimer += feedPeriod;
		}
		else
		{
			foodTimer -= dt;
		}
		//update UI
		foodLabel.text = 'Food: $foodCount/$maxFood';
		materialsLabel.text =  'Materials: $materialsCount/$maxMaterials';
		manpowerLabel.text =  'Rebeliants: $manpowerCount';
		buildShelterText.text = '$shelterCost';
		buildWarehouseText.text = '$warehouseCost';
		
	}
}
