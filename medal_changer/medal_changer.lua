local GetUi = ui.get
local SetUi = ui.set
local NewCheckbox = ui.new_checkbox
local NewCombo = ui.new_combobox
local NewSlider = ui.new_slider
local SetVisible = ui.set_visible
local SetCallback = ui.set_callback

local GetLocalPlayer = entity.get_local_player
local GetAll = entity.get_all

local Log = client.log

local AddEvent = client.set_event_callback

local misc, misc2 = "misc", "miscellaneous"

local coin_list = {
    [0]   = "None/Off",
    [1]   = "5 Year Veteran Coin",
    [2]   = "Champion at DreamHack 2013",
    [3]   = "Finalist at DreamHack 2013",
    [4]   = "Semifinalist at DreamHack 2013",
    [5]   = "Quarterfinalist at DreamHack 2013",
    [6]   = "Champion at EMS One Katowice 2014",
    [7]   = "Finalist at EMS One Katowice 2014",
    [8]   = "Semifinalist at EMS One Katowice 2014",
    [9]   = "Quarterfinalist at EMS One Katowice 2014",
    [10]  = "Champion at ESL One Cologne 2014",
    [11]  = "Finalist at ESL One Cologne 2014",
    [12]  = "Semifinalist at ESL One Cologne 2014",
    [13]  = "Quarterfinalist at ESL One Cologne 2014",
    [14]  = "Bronze Cologne 2014 Pick'Em Trophy",
    [15]  = "Silver Cologne 2014 Pick'Em Trophy",
    [16]  = "Gold Cologne 2014 Pick'Em Trophy",
    [17]  = "Champion at DreamHack Winter 2014",
    [18]  = "Finalist at DreamHack Winter 2014",
    [19]  = "Semifinalist at DreamHack Winter 2014",
    [20]  = "Quarterfinalist at DreamHack Winter 2014",
    [21]  = "Bronze DreamHack 2014 Pick'Em Trophy",
    [22]  = "Silver DreamHack 2014 Pick'Em Trophy",
    [23]  = "Gold DreamHack 2014 Pick'Em Trophy",
    [24]  = "Champion at ESL One Katowice 2015",
    [25]  = "Finalist at ESL One Katowice 2015",
    [26]  = "Semifinalist at ESL One Katowice 2015",
    [27]  = "Quarterfinalist at ESL One Katowice 2015",
    [28]  = "Bronze Katowice 2015 Pick'Em Trophy",
    [29]  = "Silver Katowice 2015 Pick'Em Trophy",
    [30]  = "Gold Katowice 2015 Pick'Em Trophy",
    [31]  = "Champion at ESL One Cologne 2015",
    [32]  = "Finalist at ESL One Cologne 2015",
    [33]  = "Semifinalist at ESL One Cologne 2015",
    [34]  = "Quarterfinalist at ESL One Cologne 2015",
    [35]  = "Bronze Cologne 2015 Pick'Em Trophy",
    [36]  = "Silver Cologne 2015 Pick'Em Trophy",
    [37]  = "Gold Cologne 2015 Pick'Em Trophy",
    [38]  = "Bronze Cluj-Napoca 2015 Pick'Em Trophy",
    [39]  = "Silver Cluj-Napoca 2015 Pick'Em Trophy",
    [40]  = "Gold Cluj-Napoca 2015 Pick'Em Trophy",
    [41]  = "Bronze Cluj-Napoca 2015 Fantasy Trophy",
    [42]  = "Silver Cluj-Napoca 2015 Fantasy Trophy",
    [43]  = "Gold Cluj-Napoca 2015 Fantasy Trophy",
    [44]  = "Champion at DreamHack Cluj-Napoca 2015",
    [45]  = "Finalist at DreamHack Cluj-Napoca 2015",
    [46]  = "Semifinalist at DreamHack Cluj-Napoca 2015",
    [47]  = "Quarterfinalist at DreamHack Cluj-Napoca 2015",
    [48]  = "Bronze Columbus 2016 Pick'Em Trophy",
    [49]  = "Silver Columbus 2016 Pick'Em Trophy",
    [50]  = "Gold Columbus 2016 Pick'Em Trophy",
    [51]  = "Bronze Columbus 2016 Fantasy Trophy",
    [52]  = "Silver Columbus 2016 Fantasy Trophy",
    [53]  = "Gold Columbus 2016 Fantasy Trophy",
    [54]  = "Champion at MLG Columbus 2016",
    [55]  = "Finalist at MLG Columbus 2016",
    [56]  = "Semifinalist at MLG Columbus 2016",
    [57]  = "Quarterfinalist at MLG Columbus 2016",
    [58]  = "Champion at ESL One Cologne 2016",
    [59]  = "Finalist at ESL One Cologne 2016",
    [60]  = "Semifinalist at ESL One Cologne 2016",
    [61]  = "Quarterfinalist at ESL One Cologne 2016",
    [62]  = "Bronze Cologne 2016 Pick'Em Trophy",
    [63]  = "Silver Cologne 2016 Pick'Em Trophy",
    [64]  = "Gold Cologne 2016 Pick'Em Trophy",
    [65]  = "Bronze Cologne 2016 Fantasy Trophy",
    [66]  = "Silver Cologne 2016 Fantasy Trophy",
    [67]  = "Gold Cologne 2016 Fantasy Trophy",
    [68]  = "Champion at ELEAGUE Atlanta 2017",
    [69]  = "Finalist at ELEAGUE Atlanta 2017",
    [70]  = "Semifinalist at ELEAGUE Atlanta 2017",
    [71]  = "Quarterfinalist at ELEAGUE Atlanta 2017",
    [72]  = "Bronze Atlanta 2017 Pick'Em Trophy",
    [73]  = "Silver Atlanta 2017 Pick'Em Trophy",
    [74]  = "Gold Atlanta 2017 Pick'Em Trophy",
    [75]  = "Champion at PGL Krakow 2017",
    [76]  = "Finalist at PGL Krakow 2017",
    [77]  = "Semifinalist at PGL Krakow 2017",
    [78]  = "Quarterfinalist at PGL Krakow 2017",
    [79]  = "Bronze Krakow 2017 Pick'Em Trophy",
    [80]  = "Silver Krakow 2017 Pick'Em Trophy",
    [81]  = "Gold Krakow 2017 Pick'Em Trophy",
    [82]  = "Champion at ELEAGUE Boston 2018",
    [83]  = "Finalist at ELEAGUE Boston 2018",
    [84]  = "Semifinalist at ELEAGUE Boston 2018",
    [85]  = "Quarterfinalist at ELEAGUE Boston 2018",
    [86]  = "Bronze Boston 2018 Pick'Em Trophy",
    [87]  = "Silver Boston 2018 Pick'Em Trophy",
    [88]  = "Gold Boston 2018 Pick'Em Trophy",
    [89]  = "Champion at FACEIT London 2018",
    [90]  = "Finalist at FACEIT London 2018",
    [91]  = "Semifinalist at FACEIT London 2018",
    [92]  = "Quarterfinalist at FACEIT London 2018",
    [93]  = "Bronze London 2018 Pick'Em Trophy",
    [94]  = "Silver London 2018 Pick'Em Trophy",
    [95]  = "Gold London 2018 Pick'Em Trophy",
    [96]  = "Operation Payback Pass",
    [97]  = "Operation Payback Challenge Coin",
    [98]  = "Silver Operation Payback Coin",
    [99]  = "Gold Operation Payback Coin",
    [100] = "Museum Map Coin",
    [101] = "Downtown Map Coin",
    [102] = "Thunder Map Coin",
    [103] = "Favela Map Coin",
    [104] = "Motel Map Coin",
    [105] = "Seaside Map Coin",
    [106] = "Library Map Coin",
    [107] = "Operation Bravo Pass",
    [108] = "Operation Bravo Challenge Coin",
    [109] = "Silver Operation Bravo Coin",
    [110] = "Gold Operation Bravo Coin",
    [111] = "Agency Map Coin",
    [112] = "Ali Map Coin",
    [113] = "Cache Map Coin",
    [114] = "Chinatown Map Coin",
    [115] = "Gwalior Map Coin",
    [116] = "Ruins Map Coin",
    [117] = "Siege Map Coin",
    [118] = "Operation Phoenix Pass",
    [119] = "Operation Phoenix Challenge Coin",
    [120] = "Silver Operation Phoenix Coin",
    [121] = "Gold Operation Phoenix Coin",
    [122] = "Operation Breakout All Access Pass",
    [123] = "Operation Breakout Challenge Coin",
    [124] = "Silver Operation Breakout Coin",
    [125] = "Gold Operation Breakout Coin",
    [126] = "Operation Vanguard Challenge Coin",
    [127] = "Silver Operation Vanguard Coin",
    [128] = "Gold Operation Vanguard Coin  ",
    [129] = "Operation Bloodhound Challenge Coin",
    [130] = "Silver Operation Bloodhound Coin",
    [131] = "Gold Operation Bloodhound Coin",
    [132] = "2015 Service Medal",
    [133] = "2015 Service Medal",
    [134] = "Operation Wildfire Challenge Coin",
    [135] = "Silver Operation Wildfire Coin",
    [136] = "Gold Operation Wildfire Coin",
    [137] = "2016 Service Medal",
    [138] = "2016 Service Medal",
    [139] = "2016 Service Medal",
    [140] = "2016 Service Medal",
    [141] = "2016 Service Medal",
    [142] = "2016 Service Medal",
    [143] = "Counter-Strike: Global Offensive Game License",
    [144] = "2017 Service Medal",
    [145] = "2017 Service Medal",
    [146] = "2017 Service Medal",
    [147] = "2017 Service Medal",
    [148] = "2017 Service Medal",
    [149] = "2017 Service Medal",
    [150] = "2017 Service Medal",
    [151] = "2018 Service Medal",
    [152] = "2018 Service Medal",
    [153] = "2018 Service Medal",
    [154] = "2018 Service Medal",
    [155] = "2018 Service Medal",
    [156] = "2018 Service Medal  ",
    [157] = "Operation Hydra Challenge Coin",
    [158] = "Silver Operation Hydra Coin",
    [159] = "Gold Operation Hydra Coin",
    [160] = "Diamond Operation Hydra Coin",
    [161] = "Dust II Pin",
    [162] = "Guardian Elite Pin",
    [163] = "Mirage Pin",
    [164] = "Inferno Pin",
    [165] = "Italy Pin",
    [166] = "Victory Pin",
    [167] = "Militia Pin",
    [168] = "Nuke Pin",
    [169] = "Train Pin",
    [170] = "Guardian Pin",
    [171] = "Tactics Pin",
    [172] = "Guardian 2 Pin",
    [173] = "Bravo Pin",
    [174] = "Baggage Pin",
    [175] = "Phoenix Pin",
    [176] = "Office Pin",
    [177] = "Cobblestone Pin",
    [178] = "Overpass Pin",
    [179] = "Bloodhound Pin",
    [180] = "Cache Pin",
    [181] = "Valeria Phoenix Pin",
    [182] = "Chroma Pin",
    [183] = "Guardian 3 Pin",
    [184] = "Canals Pin",
    [185] = "Welcome to the Clutch Pin",
    [186] = "Death Sentence Pin",
    [187] = "Inferno 2 Pin",
    [188] = "Wildfire Pin",
    [189] = "Easy Peasy Pin",
    [190] = "Aces High Pin",
    [191] = "Hydra Pin",
    [192] = "Howl Pin",
    [193] = "Brigadier General Pin",
    [194] = "Dust II Pin",
    [195] = "Guardian Elite Pin",
    [196] = "Mirage Pin",
    [197] = "Inferno Pin",
    [198] = "Italy Pin",
    [199] = "Victory Pin",
    [200] = "Militia Pin",
    [201] = "Nuke Pin",
    [202] = "Train Pin",
    [203] = "Guardian Pin",
    [204] = "Tactics Pin",
    [205] = "Guardian 2 Pin",
    [206] = "Bravo Pin",
    [207] = "Baggage Pin",
    [208] = "Phoenix Pin",
    [209] = "Office Pin",
    [210] = "Cobblestone Pin",
    [211] = "Overpass Pin",
    [212] = "Bloodhound Pin",
    [213] = "Cache Pin",
    [214] = "Valeria Phoenix Pin",
    [215] = "Chroma Pin",
    [216] = "Guardian 3 Pin",
    [217] = "Canals Pin",
    [218] = "Welcome to the Clutch Pin",
    [219] = "Death Sentence Pin",
    [220] = "Inferno 2 Pin",
    [221] = "Wildfire Pin",
    [222] = "Easy Peasy Pin",
    [223] = "Aces High Pin",
    [224] = "Hydra Pin",
    [225] = "Howl Pin",
    [226] = "Brigadier General Pin",
}

local coin_ids = {
    [0] =   0,
    [1] =   874,
    [2] =   875,
    [3] =   876,
    [4] =   877,
    [5] =   878,
    [6] =   879,
    [7] =   880,
    [8] =   881,
    [9] =   882,
    [10] =  883,
    [11] =  884,
    [12] =  885,
    [13] =  886,
    [14] =  887,
    [15] =  888,
    [16] =  889,
    [17] =  890,
    [18] =  891,
    [19] =  892,
    [20] =  893,
    [21] =  894,
    [22] =  895,
    [23] =  896,
    [24] =  897,
    [25] =  898,
    [26] =  899,
    [27] =  900,
    [28] =  901,
    [29] =  902,
    [30] =  903,
    [31] =  904,
    [32] =  905,
    [33] =  906,
    [34] =  907,
    [35] =  908,
    [36] =  909,
    [37] =  910,
    [38] =  911,
    [39] =  912,
    [40] =  913,
    [41] =  914,
    [42] =  915,
    [43] =  916,
    [44] =  917,
    [45] =  918,
    [46] =  919,
    [47] =  920,
    [48] =  921,
    [49] =  922,
    [50] =  923,
    [51] =  924,
    [52] =  925,
    [53] =  926,
    [54] =  927,
    [55] =  928,
    [56] =  929,
    [57] =  930,
    [58] =  931,
    [59] =  932,
    [60] =  933,
    [61] =  934,
    [62] =  935,
    [63] =  936,
    [64] =  937,
    [65] =  938,
    [66] =  939,
    [67] =  940,
    [68] =  941,
    [69] =  942,
    [70] =  943,
    [71] =  944,
    [72] =  945,
    [73] =  946,
    [74] =  947,
    [75] =  948,
    [76] =  949,
    [77] =  950,
    [78] =  951,
    [79] =  952,
    [80] =  953,
    [81] =  954,
    [82] =  955,
    [83] =  956,
    [84] =  957,
    [85] =  958,
    [86] =  959,
    [87] =  960,
    [88] =  961,
    [89] =  962,
    [90] =  963,
    [91] =  964,
    [92] =  965,
    [93] =  966,
    [94] =  967,
    [95] =  968,
    [96] =  1000,
    [97] =  1001,
    [98] =  1002,
    [99] =  1003,
    [100] = 1004,
    [101] = 1005,
    [102] = 1006,
    [103] = 1007,
    [104] = 1008,
    [105] = 1009,
    [106] = 1010,
    [107] = 1012,
    [108] = 1013,
    [109] = 1014,
    [110] = 1015,
    [111] = 1016,
    [112] = 1017,
    [113] = 1018,
    [114] = 1019,
    [115] = 1020,
    [116] = 1021,
    [117] = 1022,
    [118] = 1023,
    [119] = 1024,
    [120] = 1025,
    [121] = 1026,
    [122] = 1027,
    [123] = 1028,
    [124] = 1029,
    [125] = 1030,
    [126] = 1316,
    [127] = 1317,
    [128] = 1318,
    [129] = 1327,
    [130] = 1328,
    [131] = 1329,
    [132] = 1331,
    [133] = 1332,
    [134] = 1336,
    [135] = 1337,
    [136] = 1338,
    [137] = 1339,
    [138] = 1340,
    [139] = 1341,
    [140] = 1342,
    [141] = 1343,
    [142] = 1344,
    [143] = 1353,
    [144] = 1357,
    [145] = 1358,
    [146] = 1359,
    [147] = 1360,
    [148] = 1361,
    [149] = 1362,
    [150] = 1363,
    [151] = 1367,
    [152] = 1368,
    [153] = 1369,
    [154] = 1370,
    [155] = 1371,
    [156] = 1372,
    [157] = 4354,
    [158] = 4354,
    [159] = 4355,
    [160] = 4356,
    [161] = 6001,
    [162] = 6002,
    [163] = 6003,
    [164] = 6004,
    [165] = 6005,
    [166] = 6006,
    [167] = 6007,
    [168] = 6008,
    [169] = 6009,
    [170] = 6010,
    [171] = 6011,
    [172] = 6012,
    [173] = 6013,
    [174] = 6014,
    [175] = 6015,
    [176] = 6016,
    [177] = 6017,
    [178] = 6018,
    [179] = 6019,
    [180] = 6020,
    [181] = 6021,
    [182] = 6022,
    [183] = 6023,
    [184] = 6024,
    [185] = 6025,
    [186] = 6026,
    [187] = 6027,
    [188] = 6028,
    [189] = 6029,
    [190] = 6030,
    [191] = 6031,
    [192] = 6032,
    [193] = 6033,
    [194] = 6101,
    [195] = 6102,
    [196] = 6103,
    [197] = 6104,
    [198] = 6105,
    [199] = 6106,
    [200] = 6107,
    [201] = 6108,
    [202] = 6109,
    [203] = 6110,
    [204] = 6111,
    [205] = 6112,
    [206] = 6113,
    [207] = 6114,
    [208] = 6115,
    [209] = 6116,
    [210] = 6117,
    [211] = 6118,
    [212] = 6119,
    [213] = 6120,
    [214] = 6121,
    [215] = 6122,
    [216] = 6123,
    [217] = 6124,
    [218] = 6125,
    [219] = 6126,
    [220] = 6127,
    [221] = 6128,
    [222] = 6129,
    [223] = 6130,
    [224] = 6131,
    [225] = 6132,
    [226] = 6133,
}

local music_kit_list = {
    [0] = "None/Off",
    [1] = "CSGO",
    [2] = "musickit_valve_csgo_02",
    [3] = "Crimsom Assault",
    [4] = "Sharpened",
    [5] = "Insurgency",
    [6] = "A*D*8",
    [7] = "High Noon",
    [8] = "Death's Head Demolition",
    [9] = "Desert Fire",
    [10] = "LNOE",
    [11] = "Metal",
    [12] = "All I Want for Christmas",
    [13] = "IsoRhythm",
    [14] = "For No Mankind",
    [15] = "Hotline Miami",
    [16] = "The 8-Bit Kit",
    [17] = "The Talos Principle",
    [18] = "Battlepack",
    [19] = "MOLOTOV",
    [20] = "Uber Blasto Phone",
    [21] = "Hazardous Environments",
    [22] = "Headshot",
    [23] = "Total Domination",
    [24] = "I Am",
    [25] = "Diamonds",
    [26] = "Invasion!",
    [27] = "Lion's Mouth",
    [28] = "Sponge Fingerz",
    [29] = "Aggressive",
    [30] = "Java Havana Funkaloo",
    [31] = "Moments CSGO",
    [32] = "Disgusting",
    [33] = "The Good Youth",
    [34] = "FREE",
    [35] = "Life's Not Out To Get You",
    [36] = "Backbone",
    [37] = "GLA",
    [38] = "Arena"
}

local ui = {
    enabled = NewCheckbox(misc, misc2, "Enable Medal/music/commend changer"),
    private_rank = NewSlider(misc, misc2, "Private rank", 0, 40, 0),
    commends_leader = NewSlider(misc, misc2, "Leader commends", 0, 9999, 0),
    commends_teacher = NewSlider(misc, misc2, "Teacher commends", 0, 9999, 0),
    commends_friendly = NewSlider(misc, misc2, "Friendly commends", 0, 9999, 0),
    coin = NewSlider(misc, misc2, "Medal", 0, 225, 0, true, "", 0, coin_list),
    music_kit = NewSlider(misc, misc2, "Music kit", 0, 38, 0, true, "", 0, music_kit_list),
}

local bv = {
    private_rank,
    commends_leader,
    commends_teacher,
    commends_friendly,
    coin,
    music_kit,
}

local function GetProp(prop)
    local player_resource = GetAll("CCSPlayerResource")[1]
    return entity.get_prop(player_resource, prop, GetLocalPlayer())
end

local function SetProp(player_resource, prop, menu_item, value)
    if menu_item ~= nil then
        entity.set_prop(player_resource, prop, GetUi(menu_item), GetLocalPlayer())
    elseif value ~= nil then
        entity.set_prop(player_resource, prop, value, GetLocalPlayer())
    end
end

SetVisible(ui.private_rank, false)
SetVisible(ui.commends_leader, false)
SetVisible(ui.commends_teacher, false)
SetVisible(ui.commends_friendly, false)
SetVisible(ui.coin, false)
SetVisible(ui.music_kit, false)

SetCallback(ui.enabled, function()
    SetVisible(ui.private_rank, GetUi(ui.enabled))
    SetVisible(ui.commends_leader, GetUi(ui.enabled))
    SetVisible(ui.commends_teacher, GetUi(ui.enabled))
    SetVisible(ui.commends_friendly, GetUi(ui.enabled))
    SetVisible(ui.coin, GetUi(ui.enabled))
    SetVisible(ui.music_kit, GetUi(ui.enabled))
end)

local backup_values = true

AddEvent("paint", function()
    
    local player_resource = GetAll("CCSPlayerResource")[1]
    
    if backup_values == true then
        bv.coin = GetProp("m_nActiveCoinRank", ui.coin)
        bv.music_kit = GetProp("m_nMusicID", ui.coin)
        bv.private_rank = GetProp("m_nPersonaDataPublicLevel", ui.coin)
        bv.commends_leader = GetProp("m_nPersonaDataPublicCommendsLeader", ui.coin)
        bv.commends_teacher = GetProp("m_nPersonaDataPublicCommendsTeacher", ui.coin)
        bv.commends_friendly = GetProp("m_nPersonaDataPublicCommendsFriendly", ui.coin)
        backup_values = false
    end

    if GetUi(ui.enabled) == true then
        entity.set_prop(player_resource, "m_nActiveCoinRank", coin_ids[GetUi(ui.coin)], GetLocalPlayer())
        entity.set_prop(player_resource, "m_nMusicID", GetUi(ui.music_kit), GetLocalPlayer())
        SetProp(player_resource, "m_nPersonaDataPublicLevel", ui.private_rank, nil)
        SetProp(player_resource, "m_nPersonaDataPublicCommendsLeader", ui.commends_leader, nil)
        SetProp(player_resource, "m_nPersonaDataPublicCommendsTeacher", ui.commends_teacher, nil)
        SetProp(player_resource, "m_nPersonaDataPublicCommendsFriendly", ui.commends_friendly, nil)
    else
        SetProp(player_resource, "m_nActiveCoinRank", nil, bv.coin)
        SetProp(player_resource, "m_nMusicID", nil, bv.music_kit)
        SetProp(player_resource, "m_nPersonaDataPublicLevel", nil, bv.private_rank)
        SetProp(player_resource, "m_nPersonaDataPublicCommendsLeader", nil, bv.commends_leader)
        SetProp(player_resource, "m_nPersonaDataPublicCommendsTeacher", nil, bv.commends_teacher)
        SetProp(player_resource, "m_nPersonaDataPublicCommendsFriendly", nil, bv.commends_friendly)
    end
end)
