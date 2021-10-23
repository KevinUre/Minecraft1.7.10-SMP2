# Waystone (now requires meteorite)
recipes.remove(<waystones:waystone>);
recipes.addShaped(<waystones:waystone>, 
    [[null, <appliedenergistics2:tile.BlockSkyStone>, null],
	[<minecraft:glowstone_dust>, <minecraft:ender_pearl>, <minecraft:glowstone_dust>],
	[<appliedenergistics2:tile.BlockSkyStone>, <appliedenergistics2:tile.BlockSkyStone>, <appliedenergistics2:tile.BlockSkyStone>]]);

# Warpstone (now requires a nether run and killing the ender dragon)
recipes.remove(<waystones:warpStone>);
recipes.addShaped(<waystones:warpStone>, 
    [[<minecraft:ender_eye>, <minecraft:end_stone>, <minecraft:ender_eye>],
	[<minecraft:end_stone>, <minecraft:ghast_tear>, <minecraft:end_stone>],
	[<minecraft:ender_eye>, <minecraft:end_stone>, <minecraft:ender_eye>]]);

# Scroll of Recall (now requires a nether run and killing the ender dragon)
recipes.remove(<waystones:warpScroll>);
recipes.addShaped(<waystones:warpScroll> * 5, 
    [[<minecraft:blaze_powder>, <minecraft:ender_pearl>, <minecraft:redstone>],
	[<minecraft:paper>, <appliedenergistics2:tile.BlockSkyStone>, <minecraft:paper>],
	[<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]]);

# Energy Bridge (made reasonable and affordable)
recipes.remove(<PowerConverters3:powerconverters.common>);
recipes.addShaped(<PowerConverters3:powerconverters.common>, 
    [[<minecraft:gold_ingot>, <minecraft:redstone>, <minecraft:gold_ingot>],
	[<minecraft:glass>, <minecraft:redstone_block>, <minecraft:glass>],
	[<minecraft:gold_ingot>, <minecraft:redstone>, <minecraft:gold_ingot>]]);

# IC2 Armor (removed because of modular power armor)
recipes.remove(<IC2:itemArmorNanoBoots>);
recipes.remove(<IC2:itemArmorNanoChestplate>);
recipes.remove(<IC2:itemArmorNanoHelmet>);
recipes.remove(<IC2:itemArmorNanoLegs>);
recipes.remove(<IC2:itemArmorQuantumBoots>);
recipes.remove(<IC2:itemArmorQuantumChestplate>);
recipes.remove(<IC2:itemArmorQuantumHelmet>);
recipes.remove(<IC2:itemArmorQuantumLegs>);

# Broken / Unwanted CC Blocks
recipes.remove(<ImmibisPeripherals:component>);

# Computer
recipes.remove(<ComputerCraft:CC-Computer>);
recipes.addShaped(<ComputerCraft:CC-Computer>, 
    [[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
	[<minecraft:stone>, <minecraft:redstone_block>, <minecraft:stone>],
	[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]]);

# Redstone I/O Block
recipes.remove(<FirePeripherals:tile.redstoneioblock_off>);
recipes.remove(<FirePeripherals:tile.redstoneioblock_on>);
recipes.addShaped(<FirePeripherals:tile.redstoneioblock_off>, 
    [[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>],
	[<minecraft:stone>, <minecraft:redstone>, <minecraft:stone>],
	[<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]]);

# Quarry (much more expensive and harder to mass produce)
recipes.remove(<BuildCraft|Builders:machineBlock>);
recipes.addShaped(<BuildCraft|Builders:machineBlock>, 
    [[<ore:ingotSilver>, <minecraft:skull:1>, <ore:ingotSilver>],
	[<ore:circuitAdvanced>, <BuildCraft|Silicon:laserBlock>, <ore:circuitAdvanced>],
	[<IC2:itemPartIridium>, <IC2:itemDiamondBlockCuttingBlade>, <IC2:itemPartIridium>]]);

# Abyssal Wastes Gateway Key (now requires killing the ender dragon)
recipes.remove(<abyssalcraft:portalplacer>);
recipes.addShaped(<abyssalcraft:portalplacer>, 
    [[null, <ore:materialCoraliumPearl>, <abyssalcraft:OC>],
	[null, <minecraft:end_stone>, <ore:materialCoraliumPearl>],
	[<minecraft:blaze_rod>, null, null]]);

# Advanced Enchanting Table (now requires nether, some blood magic, and some thaumcraft)
recipes.remove(<eplus:item.tableUpgrade>);
recipes.remove(<eplus:tile.advancedEnchantmentTable>);
recipes.addShapeless(<eplus:tile.advancedEnchantmentTable>, 
    [<AWWayofTime:imbuedSlate>, <Thaumcraft:ItemResource:7>, <AWWayofTime:fireScribeTool>,
	<minecraft:enchanting_table>, <Thaumcraft:blockJar:1>, <minecraft:diamond_block>,
	<minecraft:potion:16>, <AWWayofTime:airScribeTool>, <minecraft:skull>]);
# 1 2 7
# 3 4 8
# 5 6 9

# IC2 Pump and Miner
recipes.remove(<IC2:blockMachine:7>);
recipes.remove(<IC2:blockMachine:8>);
recipes.remove(<IC2:blockMachine2:11>);

# Power Converters steam and universal Charger
recipes.remove(<PowerConverters3:powerconverters.steam>);
recipes.remove(<PowerConverters3:powerconverters.steam:1>);
recipes.remove(<PowerConverters3:powerconverters.common:2>); 

# IC2 Railcraft Trade Blocks
recipes.remove(<IC2:blockPersonal:1>);
recipes.remove(<IC2:blockPersonal:2>);
recipes.remove(<Railcraft:machine.alpha:6>); 

# Buildcraft Laser
recipes.remove(<BuildCraft|Silicon:laserBlock>);
recipes.addShaped(<BuildCraft|Silicon:laserBlock>, 
    [[<IC2:itemPartAlloy>, <IC2:itemBatCrystal>, <IC2:itemPartAlloy>],
	[<IC2:itemCasing:5>, <ore:blockRedstone>, <IC2:itemCasing:5>],
	[<ore:plateObsidian>, <ore:circuitAdvanced>, <ore:plateObsidian>]]);

# Buildcraft Assembly Table
recipes.remove(<BuildCraft|Silicon:laserTableBlock>);
recipes.addShaped(<BuildCraft|Silicon:laserTableBlock>, 
    [[<ore:ingotSilver>, <ore:circuitAdvanced>, <ore:ingotSilver>],
	[<IC2:itemCasing:5>, <ore:blockRedstone>, <IC2:itemCasing:5>],
	[<ore:plateObsidian>, <ore:gearDiamond>, <ore:plateObsidian>]]);

# IC2 Mining Laser
recipes.remove(<IC2:itemToolMiningLaser>);

# IC2 Centrifuge
recipes.remove(<IC2:blockMachine2:3>);
recipes.addShaped(<IC2:blockMachine2:3>, 
    [[<IC2:itemRecipePart>, <BuildCraft|Silicon:laserBlock>, <IC2:itemRecipePart>],
	[<IC2:itemCasing:5>, <IC2:blockMachine:12>, <IC2:itemCasing:5>],
	[<IC2:itemCasing:5>, <IC2:itemRecipePart:1>, <IC2:itemCasing:5>]]);
	
# IC2 Pattern Storage
recipes.remove(<IC2:blockMachine2:6>);
recipes.addShaped(<IC2:blockMachine2:6>, 
    [[<IC2:blockAlloy>, <IC2:blockAlloy>, <IC2:blockAlloy>],
	[<IC2:itemcrystalmemory>, <IC2:blockMachine:12>, <IC2:itemcrystalmemory>],
	[<BuildCraft|Silicon:laserBlock>, <ore:circuitAdvanced>, <BuildCraft|Silicon:laserBlock>]]);

# Jet Packs
recipes.remove(<IC2:itemArmorJetpackElectric>);
recipes.remove(<IC2:itemArmorJetpack>);
recipes.addShaped(<IC2:itemArmorJetpack>, 
    [[<IC2:itemPartCarbonPlate>, <ore:circuitAdvanced>, <IC2:itemPartCarbonPlate>],
	[<IC2:itemFluidCell>.withTag({Fluid:{FluidName:"ic2coolant",Amount:1000}}), <IC2:itemCasing:5>, <IC2:itemFluidCell>],
	[<IC2:itemTurningBlanks:74565>.withTag({state:{l0:1,l1:2,l2:3,l3:4,l4:5}}), <minecraft:ghast_tear>, <IC2:itemTurningBlanks:74565>.withTag({state:{l0:1,l1:2,l2:3,l3:4,l4:5}})]]);

# IC2 Railcraft Trade Blocks
recipes.remove(<IC2:blockPersonal:1>);
recipes.remove(<IC2:blockPersonal:2>);
recipes.remove(<Railcraft:machine.alpha:6>); 
