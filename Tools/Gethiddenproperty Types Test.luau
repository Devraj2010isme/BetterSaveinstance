-- Type tester for gethiddenproperty
-- Currently doesn't account for types being faked
-- Only tests types, doesn't account for capabilites and stuff
-- It's recommened but not required to run this on a game with a UnionOperation and PackageLink. Not doing so may result in some types not being tested, indicated by ⏺.

--OPTIONS:
IgnoreSharedStrings = false -- A lot of execs crash on this type
IncludeUnnecessityTypes = false
--VerifyValues = false -- Checks the outputted values for what they are meant to be to detect faking. Requires running this in a specific game: (🟠 nil is temp until/if I add this)

assert(gethiddenproperty, "Executor is missing gethiddenproperty, aborting test")
local identify_executor = identifyexecutor or getexecutorname or whatexecutor
local EXECUTOR_NAME = identify_executor and identify_executor() or "Missing identifyexecutor Function"

local instances = {}
local PassedTests, FailedTests, NotTested, NilResults = 0, 0, 0, 0
for _, v in game:GetDescendants() do
	table.insert(instances, v)
end

local function test(instance, propertyname, valuetype)
	if instance then
		ok, result = pcall(gethiddenproperty, instance, propertyname)
		
		if not ok or (type(result) == "string" and string.find(result, "Unable to get property ", 1, true)) then
			print("⛔ "..valuetype.." "..result)
			FailedTests += 1	
		elseif result == nil then
			print("🟠 "..valuetype)
			NilResults += 1
		else
			print("✅ "..valuetype)
			PassedTests += 1
		end
	else
		print("⏺ "..valuetype)
		NotTested += 1
	end
end
local function findinstance(classname)
	for _, v in instances do
		if v:IsA(classname) then
			return v
		end
	end
end

print("gethiddenproperty Types Test")
print("Executor: "..EXECUTOR_NAME)
print("✅ - Pass, ⛔ - Fail, 🟠 - Output is nil, ⏺️ - No test")


local test_WRAPLAYER = Instance.new("WrapLayer")
local test_PART = Instance.new("Part")
test_PART.Parent = test_MODEL
local test_WELDCONSTRAINT = Instance.new("WeldConstraint")
test_WELDCONSTRAINT.Part0 = test_PART
if IncludeUnnecessityTypes then
	test(workspace, "StreamOutBehavior", "Category:Enum") -- Enum Category
	test(workspace, "ExplicitAutoJoints", "bool") -- bool
	test(game:GetService("Players"), "ServerGitHash", "string") -- string (some bad exploits crash on this)
	test(Instance.new("Script"), "CachedRemoteSource", "ProtectedString") -- ProtectedString
	test(workspace, "StreamingTargetRadius", "int") -- int
	test(findinstance("PackageLink"), "PackageGuid", "int64") -- int64
	test(Instance.new("Sound"), "TimePositionReplicator", "double") -- double
	test(workspace.Terrain, "GrassLength", "float") -- float
	test(Instance.new("InputAction"), "Direction2DState", "Vector2") -- Vector2
	test(test_PART, "size", "Vector3") -- Vector3
	test(test_PART, "Origin", "CFrame") -- CFrame
	test(test_WRAPLAYER, "Color", "Color3") -- Color3
	test(Instance.new("UIListLayout"), "HorizontalPadding", "UDim") -- Udim
	test(test_WRAPLAYER, "HSRAssetId", "ContentId") -- ContentId
	test(workspace, "HistoryId", "UniqueId") -- UniqueId
end

test(test_WELDCONSTRAINT, "Part0Internal", "Category:Class") -- Class Category
test(Instance.new("AnimationRigData"), "parent", "BinaryString") -- BinaryString
test(test_PART, "NetworkOwnerV3", "SystemAddress") -- SystemAddress
if IgnoreSharedStrings then -- SharedString
	test(nil, nil, "SharedString")
else
	test(test_WRAPLAYER, "HSRData", "SharedString")
end
test(test_PART, "Color3uint8", "Color3uint8") -- Color3uint8
test(Instance.new("TerrainRegion"), "ExtentsMax", "Vector3int16") -- Vector3int16
test(workspace, "WorldPivotData", "OptionalCoordinateFrame") -- OptionalCoordinateFrame todo: make this have a value instead of nil
test(findinstance("UnionOperation"), "DCDPropertyData", "CSGPropertyData") -- CSGPropertyData
test(findinstance("UnionOperation"), "ConvexDecompHolder", "NetAssetRef") -- NetAssetRef
test(test_PART, "ReplicationPV", "ReplicationPV") -- ReplicationPV
test(Instance.new("Animator"), "FacsReplicationData", "FacsReplicationData") -- FacsReplicationData

local fullfails = FailedTests + NilResults
local rate = math.round(PassedTests / (PassedTests + fullfails) * 100)
local outOf = PassedTests .. " out of " .. (PassedTests + fullfails)

print("\n")
print("gethiddenproperty Types Summary")
print("✅ Tested with a " .. rate .. "% success rate (" .. outOf .. ")")
print("⛔ " .. FailedTests .. " tests failed")
print("🟠 " .. NilResults .. " types resulted in a nil value")
print("⏺️ ".. NotTested.. " types were not tested")
