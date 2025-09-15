# Description
A script for Roblox executors that converts the game you are in to a file you can open in Roblox Studio. (Fork UniversalSynSaveInstance with some changes such as fixing gethiddenproperty (terrain, etc) and more). I'll try to keep this up to date with the original.


# Loadstring

```lua
local Params = {
 RepoURL = "https://raw.githubusercontent.com/Devraj2010isme/BetterSaveinstance/refs/heads/main/",
 SSI = "saveinstance",
}
local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
local Options = {} -- Documentation here: https://github.com/Devraj2010isme/BetterSaveinstance/blob/main/README.md
synsaveinstance(Options)
```
# Differences From the Original
- Fixed gethiddenproperty, in the original it uses UGCValidationService:GetPropertyValue instead. (Allows for terrain to save)
- Added a counter at the end of the file to prevent overriding when writing to file names that already exist.
  - EX:
    - place 1 example.rbxlx
    - place 1 example(2).rbxlx
- Custom Decompiler (decomptype)
    - Uses a locally hosted version of Konstant 2.1 for blazingly fast speed
    - Enabled when there is no decompiler, or with the option decomptype = "custom"
- Option SaveBytecodeIfDecompilerFails
  - Used to exist in old USSI
  - View docs for more info
  - Default: false
- Option SaveCompilationErrors
  - View docs for more info
  - Default: true
- Option Crashlog
- Support for saving attributes/tags of the folder substitutes created by isolate options (IsolateLocalPlayer, etc)
- Support for properties which cannot be saved or loaded by roblox studio (CanSave or CanLoad = false in the api dump)
  - Works by converting them to attributes
  - Enabled with the option SaveAsAttributes
- Support for saving properties of instances with a NotCreatableFix
  - Works by converting them to attributes
  - Enabled with the option SavePropsAsAttributesForNotCreatableFixes 
- Better default executors for many options
- A fix for the UGCValidationService detection
  - Disabled by default, enabled with the option DisableGethiddenpropertyFallback
  - It's recommended only to enable this if you encounter a detection, as some properties cannot be read by normal gethiddenproperty and need the fallback
- Support for custom modes
  - Allows for providing a table of service names for the mode option
  - Works the same as optimized mode, but allows for the changing that hardcoded table
- More small changes and fixes
   - Option IsolateLocalPlayerCharacter now isolates as a model instead of a folder
   - NotCreatableFixes for Dragger and AdvancedDragger, as they prevent the file from opening
# Universal Syn Save Instance

Or shortly USSI, a project aimed at resurrecting saveinstance function from Synapse X.<br />
Reason: Many Executors fail miserably at providing good user experience when it comes to tinkering with saving instances.

> [!WARNING]
> As stated under the Section 7 (b) in the LICENSE:
> - You **MUST** always include the following Credit string: `UniversalSynSaveInstance https://discord.gg/wx4ThpAsmw`
> - You are **NOT** allowed to claim authorship of the source code provided in this repository
> - You **MUST** always include the following [License](https://github.com/luau/UniversalSynSaveInstance/blob/main/LICENSE)

> [!TIP]
> Important part about this saveinstance is that it doesn't modify anything, therefore reduces the amount of detection vectors by a lot.<br />
> You can also enable the `SafeMode` option to completely bypass any detections and save **ANY** game!<br /><br />
> If this script is helpful to you, please click `⭐ Star` in the upper right corner of the page to support it, thank you!
# Options Documentation
> [!NOTE]
All options are case insensitive.
- __DEBUG_MODE: `boolean`
  - This will print debug logs to console about unusual scenarios. Recommended to enable if you wish to help us improve our products and find bugs / issues with it!
  - Default: false
- Crashlog: `boolean`
  - Logs every instance saved and property read to a file. Useful for debugging crashes.
  - Default: false
- ReadMe: `boolean`
  - Includes a script parented to game in the file, containing credits, fixes, and the options used to generate the file.
  - Default: true
- SafeMode: `boolean`
  - Kicks you before Saving, which prevents you from being detected in any game.
  - Default: false
- DisableGethiddenpropertyFallback: `boolean`
  - Prevents detections in some games
  - Default: false 
- ShutdownWhenDone: `boolean`
  - Shuts the game down after saveinstance is finished.
  - Default: false
- AntiIdle: `boolean`
  - Prevents the 20-minute-Idle Kick.
  - Default: true
- Anonymous: `boolean | table`
  - Cleans the file of any info related to your account like: Name, UserId.
  - This is useful for some games that might store that info in GUIs or other Instances.
  - Might potentially mess up parts of strings that contain characters that match your Name or parts of numbers that match your UserId.
  - By default this replaces your Name with "Roblox" and UserId with "1".
  - These replacements can be customized by providing a table with a name and userid. Ex: {Name = "Roblox", UserId = "1"}
  - Default: false
- ShowStatus: `boolean`
  - Shows what Saveinstance is currently doing in a GUI.
  - Default: true
- Callback: `function`
  - If set, the serialized data will be sent to the callback function instead of to file.
  - Default: false
- mode: `string | table`
  - Controls what instances to save.
  - Valid Modes:
    - optimized: Saves a hardcoded list of services, best for general use.
    - full: Saves all services.
    - scripts: Might be removed soon, don't use this.
    - To create a custom mode, provide a table of strings with each string being a service name to save.
  - Change this to invalid mode like "invalid" if you only want ExtraInstances.
  - "optimized" mode is NOT supported with @Object option.
  - Default: "optimized"
- noscripts: `boolean`
  - Disables scripts from decompiling.
  - Aliases: Decompile (inverse, takes priority)
  - Default: false
- scriptcache: `boolean`
  - Caches decompiled scripts, so if a script with the same bytecode appears in a game multiple times, it only needs to be decompiled once.
  - Default: true
- decomptype: `string`
  - "custom" - for a built-in custom decompiler.
  - Uses Konstant 2.1, locally hosted instead of the API to increase speed. ([Konstant Discord Server](https://discord.gg/brNTY8nX8t), [Konstant Decompiled Source Code](https://raw.githubusercontent.com/Devraj2010isme/BetterSaveinstance/refs/heads/main/Dependencies/Konstant%20V2.1.luau))
  - Default: Your executor's decompiler, if available. Otherwise uses "custom" if not.
- timeout: `number`
  - If the decompilation run time exceeds this value it gets cancelled.
  - Set to -1 to disable timeout (unreliable).
  - Aliases: DecompileTimeout
  - Default: 10
- DecompileJobless: `boolean`
  - Includes already decompiled code in the output. No new scripts are decompiled.
  - Enables the option ScriptCache
  - Default: false
- SaveBytecode: `boolean`
  -  Includes bytecode in the output. Useful if you wish to be able to decompile it yourself later.
  -  Default: false
- SaveCompilationErrors: `boolean`
  - If a script fails to compile, this option saves the compilation error in the script instead of trying to pass it to the decompiler (or savebytecode), which will always result in a fail.
  - Also applies when decompilation is disabled
  - Default: true
- SaveBytecodeIfDecompilerFails: `boolean`
  - Includes bytecode in the output ONLY in these cases: if the decompiler fails (works on most decompilers), if noscripts is enabled, or if the decompiler isn't found. Useful if you wish to be able to decompile it yourself later.
  - Option Savebytecode takes priority over this. 
  - Default: false
- SaveAsAttributes `boolean`
  - Saves properties that cannot be saved or loaded by roblox studio (CanSave or CanLoad = false in the api dump) by converting them into attributes.
  - These properties aren't saved otherwise, but nothing too useful is in them.
  - Creates a Configuration instance parented to game that contains game's properties called DataModelProperties.
  - Attribute Name Format: Prefix `__NotSaveable_` then the property name with all non alphanumeric characters removed besides underscores.
  - Default: false
- DecompileIgnore: `{Instance | Instance.ClassName | [Instance.ClassName]={Instance.Name}}`
  - Ignores match & its descendants by default. To Ignore only the instance itself set the value to = false. Examples: "Chat", - Matches any instance with "Chat" ClassName, Players = {"MyPlayerName"} - Matches "Players" Class AND "MyPlayerName" Name ONLY, workspace - matches Instance by reference, [workspace] = false - matches Instance by reference and only ignores the instance itself and not its descendants.
  - Default: {TextChatService}
- IgnoreList: `{Instance | Instance.ClassName | [Instance.ClassName]={Instance.Name}}`
  - Prevents instances from saving.
  - Structure is similar to @DecompileIgnore except = false meaning if you ignore one instance it will automatically ignore its descendants.
  - Aliases: InstancesBlacklist 
  - Default: {CoreGui, CorePackages}
- ExtraInstances: `{Instance}`
  - If used with any invalid mode (like "invalidmode") it will only save these instances.
  - Default: {}
- IgnoreProperties: `table`
  - Ignores properties by Name.
  - Default: {}
- SaveCacheInterval: `number`
  - The less the value the more often it saves, but that would mean less performance due to constantly saving.
  - Default: 0x1600 * 10
- FilePath: `string`
  - Must only contain the name of the file, no file extension.
  - EX: FilePath = "Place" not "Place.rbxlx"
  - Aliases: FileName
  - Default: false
- Object: `Instance`
  - If provided, saves as .rbxmx (Model file) instead. If Object is game, it will be saved as a .rbxl file. MUST BE AN INSTANCE REFERENCE, FOR EXAMPLE - game.Workspace. "optimized" mode is NOT supported with this option. If IsModel is set to false then Object specified here will be saved as a place file.
  - Default: false
- IsModel: `boolean`
  - Saves the file as a model (.rbxmx).
  - If Object is specified then sets to true automatically, unless you set it to false.
  - Default: false
- NilInstances: `boolean`
  - Save instances that aren't parented (parented to nil) in the folder game["Nil Instances"]
  - Enables SaveNotCreatable
  - Default: false
- NilInstancesFixes: `{[Instance.ClassName]=function}`
  - This can cause some Classes to be fixed even though they might not need the fix (better be safe than sorry though). For example, Bones inherit from Attachment if we don't define them in the NilInstancesFixes then this will catch them anyways. TO AVOID THIS BEHAVIOR USE THIS EXAMPLE: {ClassName_That_Doesnt_Need_Fix = false}.
  - Default: {Animator = function, AdPortal = function, Attachment = function, BaseWrap = function, PackageLink = function}
- IgnoreDefaultProperties: `boolean`
  - Ignores default properties during saving.
  - Aliases: IgnoreDefaultProps
  - Default: true
- IgnoreNotArchivable: `boolean`
  - Ignores the Archivable property and saves Non-Archivable instances.
  - Aliases: IgnoreArchivable 
  - Default: true
- IgnorePropertiesOfNotScriptsOnScriptsMode: `boolean`
  - Ignores properties of every instance that is not a script in "scripts" mode.
  - Default: false
- IgnoreSpecialProperties: `boolean`
  - Prevents calls to gethiddenproperty and uses fallback methods instead. This also helps with crashes. If your file is corrupted after saving, you can try turning this on.
  - Default: false (except on the executors Fluxus, Solara, Visual, WRD, and JJSploit x Xeno)
- IsolateLocalPlayer: `boolean`
  - Saves Children of LocalPlayer as separate folder and prevents any instance of ClassName Player with .Name identical to LocalPlayer.Name from saving.
  - Enables SaveNotCreatable
  - Aliases: IsolatePlayerGui
  - Default: false
- IsolateStarterPlayer: `boolean`
  - If enabled, StarterPlayer will be cleared and the saved starter player will be placed into folders.
  - Default: false
- IsolateLocalPlayerCharacter: `boolean`
  - Saves Children of LocalPlayer.Character as separate folder, and prevents the character from saving in workspace.
  - Enables SaveNotCreatable
  - Default: false
- RemovePlayerCharacters: `boolean`
  - Ignore player characters while saving.
  - Enables SaveNotCreatable automatically
  - Aliases: SavePlayerCharacters (inverse, takes priority)
  - Default: true
- SaveNotCreatable: `boolean`
  - Includes non-serializable instances as Folder objects (Name is misleading as this is mostly a fix for certain NilInstances and isn't always related to NotCreatable).
  - The instances this is applied to is controlled by NotCreatableFixes
  - Default: false
- NotCreatableFixes: `table<Instance.ClassName>`
  - The instances to convert using SaveNotCreatable
  - {"Player"} is the same as {Player = "Folder"}; Format like {SpawnLocation = "Part"} is only to be used when SpawnLocation inherits from "Part" AND "Part" is Creatable.
  - Default: {["CloudLocalizationTable"] = "LocalizationTable", ["InputObject"] = "Folder", ["LodDataEntity"] = "Folder", ["LodDataService"] = "Folder",["Translator"] = "Folder", ["TextChatMessage"] = "Folder", [""] = "Folder", ["AnimationTrack"] = "Folder", ["Player"] = "Folder", ["PlayerGui"] = "Folder", ["PlayerScripts"] = "Folder", ["PlayerMouse"] = "Folder", ["ScreenshotHud"] = "Folder", ["StudioData"] = "Folder", ["TextSource"] = "Folder", ["TouchTransmitter"] = "Folder", ["Dragger"] = "Folder", ["AdvancedDragger"] = "Folder"}
 - SavePropsAsAttributesForNotCreatableFixes
   - Converts CanSave/CanLoad properties of instances with a NotCreatableFix which can't be saved otherwise into attributes.
   - Enables SaveNotCreatable
   - Doesn't save properties when they are already saved normally. (Ex: In the spawnlocation example above, only properties that only apply to the spawnlocation, not the part will be saved)
   - Attribute Name Format: Same as SaveAsAttributes but with the prefix `__NotCreatableFix_`.
   - Default: false
- IsolatePlayers: `boolean`
  - Saves players in a seperate folder.
  - Enables SaveNotCreatable
  - Aliases: SavePlayers, RemovePlayers (inverse, takes priority)
  - Default: false
- AlternativeWritefile: `boolean`
  - Splits file content string into segments and writes them using appendfile. This might help with crashes when it starts writing to file. Though there is a risk of appendfile working incorrectly on some executors.
  - Default: true (except on the executors JJSploit, Xeno, Zorara)
- IgnoreDefaultPlayerScripts: `boolean`
  - Ignores Default PlayerScripts like PlayerModule & RbxCharacterSounds. Prevents crashes on certain Executors.
  - Default: true
- IgnoreSharedStrings: `boolean`
  - Prevents the value type "SharedString" from saving. Prevents Crashes on some executors.
  - Default: true (except on the executors Wave, Potassium, Zenith, Seliware, Volcano, Velocity and Swift, as they are confirmed to support sharedstrings.)
- SharedStringOverwrite: `boolean`
  - SharedStrings can also be used for ValueTypes that aren't SharedString, this behavior is not documented anywhere but makes sense (Could create issues though, due to potential ValueType mix-up, only works on certain types which are all base64 encoded so far).
  - Reason: Allows for potential smaller file size (can also be bigger in some cases).
  - Default: false
- TreatUnionsAsParts: `boolean`
  - Converts all UnionOperations to Parts. Useful if your Executor isn't able to save (read) Unions, because otherwise they will be invisible.
  - Default: false (except on Solara, Xeno, and JJSploit)
# Function Documentation
- SynSaveInstance.saveinstance(
  - Yields
  - Parameter_1: `variant<table,table<Instance>>`
    - Can either be SynSaveInstance.CustomOptions table or a filled with instances ({Instance}).
    - If it is filled with instances, then it will be treated as ExtraInstances with an invalid mode and IsModel will be true.
  - Parameter_2: `table`
    - Optional
    - If present, then Parameter_2 will be assumed to be SynSaveInstance.CustomOptions table.
    - If Parameter_1 is an Instance, then it will be assumed to be SynSaveInstance.CustomOptions table.Object.
    - If Parameter_1 is a table filled with instances ({Instance}), then it will be assumed to be SynSaveInstance.CustomOptions table.ExtraInstances and IsModel will be true
    - This exists for sake compatibility with saveinstance(game, {})
- ) → ()
# Acknowledgments
> [!IMPORTANT]
> This document is based largely on the efforts of [@Anaminus] & [@Dekkonot], authors of the [Roblox Format Specifications]. Additional
resources include:
> 
> - [Syngp Synapse X Source code 2019][Synapse X Source 2019] for base saveinstance code (extended by [@mblouka] & [@Acrillis])
> - [Moon/LorekeeperZinnia][@LorekeeperZinnia] for being the original creator of saveinstance that was used in Synapse X, Elysian and many others. As well as being an inspiration for this project.
> - [Rojo Rbx Dom Xml] for being a fallback documentation in case something wasn't clear in the [Roblox Format Specifications]
> - [Roblox File Format] for a list of redirects of old/deprecated xml properties that still use the old tag values
> - [Roblox Client Tracker] for an extended & close to full JSON Api Dump (with hidden properties & default values)

\*\*\* View source code of this file for more credits

[@Acrillis]: https://github.com/Acrillis
[@Anaminus]: https://github.com/Anaminus
[@Dekkonot]: https://github.com/Dekkonot
[@mblouka]: https://github.com/mblouka
[@LorekeeperZinnia]: https://github.com/LorekeeperZinnia
[bit32]: https://create.roblox.com/docs/reference/engine/libraries/bit32
[buffer]: https://create.roblox.com/docs/reference/engine/libraries/buffer
[pack]: https://create.roblox.com/docs/reference/engine/libraries/string#pack
[unpack]: https://create.roblox.com/docs/reference/engine/libraries/string#unpack
[string]: https://create.roblox.com/docs/reference/engine/libraries/string
[DataType Exceptions]: https://github.com/rojo-rbx/rbx-dom/blob/8ca9250fa5a5ad3756c89e1e111e1aabaf698b27/rbx_reflector/src/cli/generate.rs#L196
[KRNL Docs]: https://app.archbee.com/public/PREVIEW-2Jp4SDaAD4P1COFfx1p_t/PREVIEW-EtjA4sQe5zYUxIHwA6CqJ#mDB9D
[KRNL-like saveinstance Options]: https://app.archbee.com/public/PREVIEW-2Jp4SDaAD4P1COFfx1p_t/PREVIEW-EtjA4sQe5zYUxIHwA6CqJ#mDB9D
[Rojo Rbx Dom Xml]: https://github.com/rojo-rbx/rbx-dom/blob/master/docs/xml.md
[Rojo Rbx Dom Binary]: https://github.com/rojo-rbx/rbx-dom/blob/master/docs/binary.md
[Luau Syntax]: https://luau-lang.org/syntax
[Rbx-Binary-Format]: https://github.com/Dekkonot/rbx-binary-format/blob/master/src/writer.lua
[Roblox Client Tracker]: https://github.com/MaximumADHD/Roblox-Client-Tracker
[Roblox File Format]: https://github.com/MaximumADHD/Roblox-File-Format
[Roblox Format Specifications]: https://github.com/RobloxAPI/spec/
[Roblox Format Specifications Binary]: https://github.com/RobloxAPI/spec/blob/master/formats/rbxl.md
[SharedStrings]: https://github.com/RobloxAPI/spec/blob/master/formats/rbxlx.md#sharedstring
[Synapse X Docs Old]: https://synapsexdocs.github.io/custom-lua-functions/misc-functions/#save-instance
[debug]: https://web.archive.org/web/20221021015553/https://docs.synapse.to/reference/debug_lib.html
[Synapse X Docs]: https://web.archive.org/web/20230318113846/https://docs.synapse.to/reference/misc.html
[Synapse X Source 2019]: https://github.com/Acrillis/SynapseX
[PropertyPatches v1]: https://github.com/MaximumADHD/Roblox-File-Format/blob/main/Plugins/GenerateApiDump/PropertyPatches.lua#L72
[PropertyPatches v2]: https://github.com/rojo-rbx/rbx-dom/tree/master/patches
[PropertyPatches v3]: https://github.com/rojo-rbx/rbx-dom/blob/master/rbx_dom_lua/src/customProperties.lua
[UNC]: https://github.com/unified-naming-convention/NamingStandard/commit/613c1956b801ace54ba141dfc60842a16608b54f
