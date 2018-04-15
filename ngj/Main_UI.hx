package ngj;

import h2d.Flow;
import h2d.Slider;
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
	var s2d:Dynamic;
	
	//balance
	var scavengeTime:Float = 1; //cheats!!! 60*3;
	var raidTime:Float = 60 * 10;
	var trainSoldiersTime:Float = 60 * 10;
	var gunTime:Float = 60 * 10;
	var foodPerScavenge:Float = 5;
	var materialsPerScavenge:Float = 5;
	var foodPerRaid:Float = 50;
	var materialsPerRaid:Float = 50;
	var raidSpread:Float = 0.20;
	var scavengeSpread:Float = 0.35;
	var manpowerPerShelter:Float = 1;
	var shelterBaseCost:Float = 10;
	var warehouseBaseCost:Float = 100;
	var radiostationBaseCost:Float = 100;
	var armoryBaseCost:Float = 200;
	var maxBaseGuns:Float = 5;
	var maxBaseSoldiers:Float = 5;
	var feedPeriod:Float = 120;
	var maxFoodBase:Float = 200;
	var maxMaterialsBase:Float = 200;
	var influenceBase:Float = 10;
	var maxInfluence:Float = 60;
	var gunCostFood:Float = 100;
	var gunCostMaterials:Float = 20;
	
	//control variables //potem trzeba to w init dodac
	var scavenging:Bool = false;
	var raiding:Bool = false;
	var gunning:Bool = false;
	var training:Bool = false;
	var gunTimer:Float = 0;
	var trainSoldiersTimer:Float = 0;
	var shelterCost:Float = 10;
	var shelterLevel:Float = 0;
	var warehouseCost:Float = 100;
	var warehouseLevel:Float = 0;
	var radiostationCost:Float = 100;
	var radiostationLevel:Float = 0;
	var armoryCost:Float = 200;
	var armoryLevel:Float = 0;
	var foodTimer:Float = 0;
	var maxFood:Float = 200;
	var maxMaterials:Float = 200;
	var maxGuns:Float = 5;
	var maxSoldiers:Float = 5;
	var scavengeTimer:Float = 0;
	var raidTimer:Float = 0;	
	var name:String = "nordicGameJam";
	
	var leftBar : h2d.Flow;
	var scavengeButton:Flow;
	var scavTimerText:Text;
	var buildShelterButton:Flow;
	var buildShelterText:Text;
	var buildWarehouseButton:Flow;
	var buildWarehouseText:Text;
	var buildRadiostationButton:Flow;
	var buildRadiostationText:Text;
	var buildArmoryButton:Flow;
	var buildArmoryText:Text;
	
	var centerBar:Flow;
	var raidCityButton:Flow;
	var raidCityText:Text;
	var trainSoldierButton:Flow;
	var trainSoldierText:Text;
	var buyGunsButton:Flow;
	var buyGunsText:Text;
	var attackButton:Flow;
	var attackText:Text;
	
	var rightBar:Flow;
	var foodLabel:Text;
	var foodCount:Float = 0;
	var materialsLabel:Text;
	var materialsCount:Float = 0;
	var manpowerLabel:Text;
	var manpowerCount:Float = 0;
	var influenceLabel:Text;
	var influenceCount:Float = 0;
	var influenceSlider:Slider;
	var gunsLabel:Text;
	var gunsCount:Float = 0;
	var soldiersLabel:Text;
	var soldiersCount:Float = 0;
	
	function new ()
	{
		
	}
	
	public function buildUI(s2d:Dynamic)
	{
		this.s2d = s2d;
		
		leftBar = new h2d.Flow(s2d);
		leftBar.isVertical = true;
		leftBar.verticalSpacing = 5;
		leftBar.padding = 10;
		leftBar.y = s2d.height / 2;
		
		centerBar = new h2d.Flow(s2d);
		centerBar.isVertical = true;
		centerBar.verticalSpacing = 5;
		centerBar.padding = 10;
		centerBar.y = s2d.height / 2;
		centerBar.x = s2d.width / 2 - s2d.width/5;
		
		rightBar = new h2d.Flow(s2d);
		rightBar.isVertical = true;
		rightBar.verticalSpacing = 5;
		rightBar.padding = 10;
		rightBar.y = s2d.height / 2;
		rightBar.x = s2d.width / 2 + s2d.width / 4;
		
		var buttonFlow:Flow = new Flow(leftBar);
		buttonFlow.horizontalSpacing = 5;
		//buttonFlow.paddingBottom = 7;
		scavengeButton = SimpleUI.addButton(buttonFlow, "SCAVENGE", onScavenge);
		scavTimerText = SimpleUI.addText(buttonFlow, '');
		SimpleUI.addText(leftBar, "Scavenge for food n' stuff");
		
		var buttonFlow:Flow = new Flow(leftBar);
		buttonFlow.horizontalSpacing = 5;
		//buttonFlow.padding = 10;
		buildShelterButton = SimpleUI.addButton(buttonFlow, "BUILD SHELTER", function() {});
		buildShelterText = SimpleUI.addText(buttonFlow,  '$shelterCost');
		SimpleUI.addText(leftBar, "Provide shelter for rebeliants");
		
		foodLabel = SimpleUI.addText(rightBar, 'Food: $foodCount');
		materialsLabel = SimpleUI.addText(rightBar, 'Materials: $materialsCount');
	}
	
	function buildPopUpWindow(?s2d:Dynamic,label:String)
	{
		var fpw:Flow = new Flow(s2d);
		fpw.isVertical = true;
		fpw.verticalSpacing = 5;
		fpw.padding = 10;
		fpw.y = s2d.height / 4;
		fpw.x = s2d.width / 4;
		fpw.backgroundTile = h2d.Tile.fromColor(0x606060);
		
		SimpleUI.addText(fpw, label);
		SimpleUI.addButton(fpw, "Close window", function() {fpw.remove(); });
	}
	
	function onScavenge()
	{
		scavenging = true;
		scavengeTimer = scavengeTime;
	}
	
	function onRaidCity()
	{
		raiding = true;
		raidTimer = raidTime;
	}
	
	function onBuyGuns()
	{
		foodCount -= gunCostFood;
		materialsCount -= gunCostMaterials;
		gunning = true;
		gunTimer = gunTime;
	}
	
	function onTrainSoldiers()
	{
		training = true;
		manpowerCount -= 1;
		trainSoldiersTimer = trainSoldiersTime;
	}
	
	function onShelterBuild()
	{
		manpowerCount += manpowerPerShelter;
		materialsCount -= shelterCost;
		shelterLevel += 1;
		shelterCost = shelterBaseCost * (shelterLevel + 1);
		if (shelterLevel == 1)
		{
			var buttonFlow:Flow = new Flow(leftBar);
			buttonFlow.horizontalSpacing = 5;
			//buttonFlow.padding = 10;
			buildWarehouseButton = SimpleUI.addButton(buttonFlow, "BUILD WAREHOUSE", onBuildWarehouse);
			buildWarehouseText = SimpleUI.addText(buttonFlow, '$warehouseCost');
			SimpleUI.addText(leftBar, "Build warehouse to store more");
			
			manpowerLabel = SimpleUI.addText(rightBar, 'Rebeliants: $manpowerCount');
		}
	}
	
	function onBuildWarehouse()
	{
		materialsCount -= warehouseCost;
		warehouseLevel += 1;
		maxFood = maxFoodBase * (warehouseLevel + 1);
		maxMaterials = maxMaterialsBase * (warehouseLevel + 1);
		warehouseCost = warehouseBaseCost * (warehouseLevel + 1);
		if (warehouseLevel == 1)
		{
			var buttonFlow:Flow = new Flow(leftBar);
			buttonFlow.horizontalSpacing = 5;
			//buttonFlow.padding = 10;
			buildRadiostationButton = SimpleUI.addButton(buttonFlow, "BUILD RADIOSTATION", onBuildRadiostation);
			buildRadiostationText = SimpleUI.addText(buttonFlow, '$radiostationCost');
			SimpleUI.addText(leftBar, "Transmit your own propaganda!");
		}
	}
	
	function onBuildRadiostation()
	{
		materialsCount -= radiostationCost;
		radiostationLevel += 1;
		influenceCount = influenceBase * radiostationLevel;
		radiostationCost = radiostationBaseCost * (radiostationLevel + 1);
		if (radiostationLevel == 1)
		{
			var buttonFlow:Flow = new Flow(leftBar);
			buttonFlow.horizontalSpacing = 5;
			//buttonFlow.padding = 10;
			buildArmoryButton = SimpleUI.addButton(buttonFlow, "BUILD ARMORY", onBuildArmory);
			buildArmoryText = SimpleUI.addText(buttonFlow, '$armoryCost');
			SimpleUI.addText(leftBar, "You need armory to store weapons and train soldiers");
			
			//influenceLabel = SimpleUI.addText(rightBar, 'Influence: $influenceCount');
			influenceSlider = SimpleUI.addSlider(rightBar, "Influence", function() {return influenceCount; }, function(b:Float) {}, 0, maxInfluence);
			influenceSlider.preventClick();
			influenceSlider.cursor = Default;
			influenceSlider.tile = h2d.Tile.fromColor(0x606060, 1, 10);
			influenceSlider.cursorTile = h2d.Tile.fromColor(0x202020, 1, 10);			
			gunsLabel = SimpleUI.addText(rightBar, 'Guns: $gunsCount');
			soldiersLabel = SimpleUI.addText(rightBar, 'Soldiers: $soldiersCount');
			//influenceSlider = SimpleUI.addSlider(rightBar, "influence", function() {return 50}, function(b:Float) {}, 0, 100);
			buildPopUpWindow(s2d, "You've contacted with foreign state that is willing to help you! They've sent you some rifles and soldiers.");
			gunsCount += 1;
			soldiersCount += 2;
			
			var buttonFlow:Flow = new Flow(centerBar);
			buttonFlow.horizontalSpacing = 5;
			//buttonFlow.padding = 10;
			raidCityButton = SimpleUI.addButton(buttonFlow, "RAID CITY",onRaidCity);
			raidCityText = SimpleUI.addText(buttonFlow, '');
			SimpleUI.addText(centerBar, "I know it's horrible but it's for greater good!");
						
			var buttonFlow:Flow = new Flow(centerBar);
			buttonFlow.horizontalSpacing = 5;
			//buttonFlow.padding = 10;
			buyGunsButton = SimpleUI.addButton(buttonFlow, "SMUGGLE GUNS",onBuyGuns);
			buyGunsText = SimpleUI.addText(buttonFlow, '');
			SimpleUI.addText(centerBar, 'Cost: $gunCostFood Food, $gunCostMaterials Materials');
		}
		if (influenceCount >= maxInfluence)
		{
			var buttonFlow:Flow = new Flow(centerBar);
			buttonFlow.horizontalSpacing = 5;
			//buttonFlow.padding = 10;
			attackButton = SimpleUI.addButton(buttonFlow, "ATTACK GOVERMENT", function() { buildPopUpWindow(s2d,'The dawn of dictatorship marks a new era... Long live $name!'); });
			attackText = SimpleUI.addText(buttonFlow, '');
		}
	}
	
	function onBuildArmory()
	{
		materialsCount -= armoryCost;
		armoryLevel += 1;
		maxGuns = maxBaseGuns * (armoryLevel + 1);
		maxSoldiers = maxBaseSoldiers * (armoryLevel + 1);
		armoryCost = armoryBaseCost * (armoryLevel + 1);
		
		if (armoryLevel == 1)
		{
			var buttonFlow:Flow = new Flow(centerBar);
			buttonFlow.horizontalSpacing = 5;
			//buttonFlow.padding = 10;
			trainSoldierButton = SimpleUI.addButton(buttonFlow, "TRAIN SOLDIER",onTrainSoldiers);
			trainSoldierText = SimpleUI.addText(buttonFlow, '');
			SimpleUI.addText(centerBar, "Cost: 1 Gun, 1 Rebeliant. With more Soldiers you can ride more effectively!");
		}
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
		if (raiding)
		{
			if (raidTimer > 0)
			{
				disableButton(raidCityButton);
				raidTimer -= dt;
				raidCityText.text = '$raidTimer';
			}
			else
			{
				enableButton(raidCityButton,onRaidCity);
				raiding = false;
				var spread = (Math.random() * raidSpread) - raidSpread/2;
				foodCount += Math.round((foodPerRaid * soldiersCount)+ (spread * foodPerRaid * soldiersCount));
				materialsCount +=Math.round((materialsPerRaid * soldiersCount) - (spread * materialsPerRaid * soldiersCount));
				raidCityText.text = '';
			}
		}
		if (gunning)
		{
			if (gunTimer > 0)
			{
				disableButton(buyGunsButton);
				gunTimer -= dt;
				buyGunsText.text = '$gunTimer';
			}
			else
			{
				gunning = false;
				gunsCount += 1;
				buyGunsText.text = '';
			}
		}
		if (materialsCount < gunCostMaterials || foodCount < gunCostFood)
		{
			disableButton(buyGunsButton);
		}
		
		if(materialsCount >= gunCostMaterials && foodCount >= gunCostFood && !gunning)
		{
			enableButton(buyGunsButton,onBuyGuns);
		}
		
		
		if (training)
		{
			if (trainSoldiersTimer > 0)
			{
				disableButton(trainSoldierButton);
				trainSoldiersTimer -= dt;
				trainSoldierText.text = '$trainSoldiersTimer';
			}
			else
			{
				
				training = false;
				soldiersCount += 1;
				trainSoldierText.text = '';
			}
		}
		if (manpowerCount < 1 || gunsCount < 1)
		{
			disableButton(trainSoldierButton);
		}
		
		if(manpowerCount >= 1 && gunsCount >= 1 && !training)
		{
			enableButton(trainSoldierButton,onTrainSoldiers);
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
		if (materialsCount < radiostationCost)
		{
			disableButton(buildRadiostationButton);
		}
		else
		{
			enableButton(buildRadiostationButton, onBuildRadiostation);
		}
		if (materialsCount < armoryCost)
		{
			disableButton(buildArmoryButton);
		}
		else
		{
			enableButton(buildArmoryButton, onBuildArmory);
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
		if(manpowerLabel != null)
			manpowerLabel.text =  'Rebeliants: $manpowerCount';
		if(influenceLabel != null)
			influenceLabel.text =  'Influence: $influenceCount';
		if (influenceSlider != null)
			influenceSlider.value = influenceCount;
		if(gunsLabel != null)
			gunsLabel.text =  'Guns: $gunsCount/$maxGuns';
		if(soldiersLabel != null)
			soldiersLabel.text =  'Soldiers: $soldiersCount/$maxSoldiers';
		if(buildShelterText != null)
			buildShelterText.text = '$shelterCost';
		if(buildWarehouseText != null)
			buildWarehouseText.text = '$warehouseCost';
		if(buildRadiostationText != null)
			buildRadiostationText.text = '$radiostationCost';
		if(buildArmoryText != null)
			buildArmoryText.text = '$armoryCost';
		
	}
}
