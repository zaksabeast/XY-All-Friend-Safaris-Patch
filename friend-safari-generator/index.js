const MT = require("./mt.js");

const FRIEND_SAFARIS = [
  [
    ["Lillipup", "Dunsparce", "Teddiursa", "Aipom"],
    ["Kecleon", "Minccino", "Loudred", "Audino"],
    ["Eevee", "Ditto", "Smeargle", "Chansey"],
  ],
  [
    ["Meditite", "Mankey", "Machoke", "Mienfoo"],
    ["Pancham", "Pancham", "Throh", "Sawk"],
    ["Hariyama", "Tyrogue", "Riolu", "Breloom"],
  ],
  [
    ["Pidgey", "Spearow", "Farfetch’d", "Doduo"],
    ["Hoothoot", "Tranquill", "Swanna", "Woobat"],
    ["Rufflet", "Tropius", "Fletchinder", "Hawlucha"],
  ],
  [
    ["Kakuna", "Cascoon", "Seviper", "Gloom"],
    ["Venomoth", "Swalot", "Garbodor", "Ariados"],
    ["Toxicroak", "Drapion", "Muk", "Whirlipede"],
  ],
  [
    ["Phanpy", "Wooper", "Trapinch", "Sandshrew"],
    ["Marowak", "Camerupt", "Dugtrio", "Nincada"],
    ["Palpitoad", "Gastrodon", "Diggersby", "Diggersby"],
  ],
  [
    ["Dwebble", "Dwebble", "Nosepass", "Boldore"],
    ["Pupitar", "Corsola", "Onix", "Magcargo"],
    ["Rhydon", "Shuckle", "Barbaracle", "Barbaracle"],
  ],
  [
    ["Butterfree", "Combee", "Ledyba", "Paras"],
    ["Beautifly", "Masquerain", "Volbeat", "Illumise"],
    ["Vivillon", "Venomoth", "Pinsir", "Heracross"],
  ],
  [
    ["Shuppet", "Shuppet", "Lampent", "Lampent"],
    ["Phantump", "Phantump", "Pumpkaboo", "Pumpkaboo"],
    ["Golurk", "Drifblim", "Dusclops", "Spiritomb"],
  ],
  [
    ["Ferroseed", "Ferroseed", "Mawile", "Magneton"],
    ["Metang", "Klang", "Skarmory", "Forretress"],
    ["Bronzong", "Excadrill", "Klefki", "Klefki"],
  ],
  [
    ["Ponyta", "Growlithe", "Pansear", "Magmar"],
    ["Charmeleon", "Pyroar", "Slugma", "Larvesta"],
    ["Braixen", "Braixen", "Fletchinder", "Ninetales"],
  ],
  [
    ["Krabby", "Bibarel", "Panpour", "Octillery"],
    ["Wartortle", "Quagsire", "Gyarados", "Floatzel"],
    ["Frogadier", "Frogadier", "Azumarill", "Poliwhirl"],
  ],
  [
    ["Oddish", "Tangela", "Pansage", "Sunkern"],
    ["Ivysaur", "Petilil", "Sawsbuck", "Swadloon"],
    ["Quilladin", "Quilladin", "Maractus", "Gogoat"],
  ],
  [
    ["Electrode", "Emolga", "Dedenne", "Pachirisu"],
    ["Pikachu", "Helioptile", "Electabuzz", "Stunfisk"],
    ["Luxio", "Galvantula", "Zebstrika", "Manectric"],
  ],
  [
    ["Abra", "Drowzee", "Grumpig", "Munna"],
    ["Wobbuffet", "Sigilyph", "Espurr", "Espurr"],
    ["Duosion", "Xatu", "Girafarig", "Gothorita"],
  ],
  [
    ["Snorunt", "Delibird", "Spheal", "Snover"],
    ["Bergmite", "Bergmite", "Sneasel", "Beartic"],
    ["Lapras", "Cloyster", "Dewgong", "Piloswine"],
  ],
  [
    ["Gabite", "Gabite", "Fraxure", "Fraxure"],
    ["Shelgon", "Dragonair", "Noibat", "Noibat"],
    ["Druddigon", "Druddigon", "Sliggoo", "Sliggoo"],
  ],
  [
    ["Pawniard", "Vullaby", "Nuzleaf", "Mightyena"],
    ["Sneasel", "Sandile", "Cacturne", "Crawdaunt"],
    ["Liepard", "Inkay", "Absol", "Sableye"],
  ],
  [
    ["Kirlia", "Snubbull", "Togepi", "Dedenne"],
    ["Mawile", "Jigglypuff", "Spritzee", "Swirlix"],
    ["Floette", "Clefairy", "Floette", "Floette"],
  ],
];

const FRIEND_SAFARI_TYPES = [
  0, 9, 10, 11, 12, 14, 1, 3, 4, 2, 13, 6, 5, 7, 15, 16, 8, 17, 0, 9, 10, 11,
  12, 14, 1, 3, 4, 2, 13, 6, 5, 7,
];

const FRIEND_SAFARI_SHIFT_NUMS = [3, 6, 9, 12, 16];
const SLOT_1_SHIFT_NUMS = [20, 23];
const SLOT_2_SHIFT_NUMS = [27, 30];
const SLOT_3_SHIFT_NUMS = [15, 24];

const twistRand = (rand, shiftNums) => {
  let result = 0;

  for (let i = 0; i < shiftNums.length; i++) {
    const shiftNum = shiftNums[i] - 1;
    result |= ((rand & (1 << shiftNum)) >> shiftNum) << i;
  }

  return result;
};

const getSafarisFromLocalFriendCode = (localFriendCode) => {
  const maskedSeed = localFriendCode | 0x81000008000801n;
  const seedLow = Number(maskedSeed & 0xffffffffn);
  const seedHigh = Number(maskedSeed >> 32n);
  const seedArr = [seedLow, seedHigh];
  const mt = new MT();
  mt.init_by_array(seedArr, seedArr.length);
  const rand = mt.genrand_int32();

  const friendSafariIndex =
    FRIEND_SAFARI_TYPES[twistRand(rand, FRIEND_SAFARI_SHIFT_NUMS)];
  const slot1Index = twistRand(rand, SLOT_1_SHIFT_NUMS);
  const slot2Index = twistRand(rand, SLOT_2_SHIFT_NUMS);
  const slot3Index = twistRand(rand, SLOT_3_SHIFT_NUMS);

  const friendSafari = FRIEND_SAFARIS[friendSafariIndex];

  return [
    friendSafari[0][slot1Index],
    friendSafari[1][slot2Index],
    friendSafari[2][slot3Index],
  ];
};
