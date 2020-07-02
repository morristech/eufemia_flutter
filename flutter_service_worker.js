'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "7207847fa3da14ee82b291e6a287f7e1",
"/": "7207847fa3da14ee82b291e6a287f7e1",
"main.dart.js": "80ff8eb8a4331d93dac694f91ede0b01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "00e0b69b49487ce4f9ff0c5fac8fda49",
"assets/AssetManifest.json": "3bf435c7419c35ec5e5c51ca73c64c07",
"assets/NOTICES": "9f53fff6b0d3755e808fd311447a982b",
"assets/FontManifest.json": "f84ab4946eeeb927345b9d0c0dcb7462",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/eufemia_components/lib/assets/EufemiaIcons.ttf": "a9b5c0668c728be057e5b52852cdddd0",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_kf_active.svg": "217edb1ee89e551f735d82f185684243",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_wallet_inactive.svg": "0d27b45342765f1f06cb6e16641a4b9f",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_kf_inactive.svg": "c32a4f7711c6499bda41249c637373ec",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_kf_active.svg": "366876511826a47d5203b18aef12404d",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/pb_coins_inactive.svg": "93f3e8e64ef511f2450bb0f8820a1fd4",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_house_inactive.svg": "b100de464964e996b942f1100bb8da0a",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/saga_person_inactive.svg": "4ea1a3c8832695a4e53e7214ef9992e7",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_house_active.svg": "5980bdc2758937cd53c59a4423f3f093",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/pb_person_inactive.svg": "4ea1a3c8832695a4e53e7214ef9992e7",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/pb_wallet_active.svg": "71eaf922cc140e5985d76f5c6e83326e",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/saga_house_active.svg": "a2551dab3f2d1b64e7378f14c161ad9f",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/pb_person_active.svg": "325722d8fd7173f77fdefac47aa1d76e",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_house_inactive.svg": "7c68e22d97f91f73e874bdd5b73ca0b0",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/saga_person_active.svg": "e66ead7e01052589256ddd300a52c844",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/saga_coins_active.svg": "48682559b19cc6bb9d8ba71ffd222c3f",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/saga_wallet_active.svg": "ec908ec350b782ae83e1dc350832c6a1",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/saga_coins_inactive.svg": "93f3e8e64ef511f2450bb0f8820a1fd4",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_coins_active.svg": "c78d86c6978d1aa411e948ca9e490296",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_person_inactive.svg": "4ea1a3c8832695a4e53e7214ef9992e7",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_person_active.svg": "6399851de83dc347c985bb741bc41779",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_coins_active.svg": "f9ff7a6918a1be3ddc25d8a234c29b00",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_wallet_active.svg": "62d57d44d6c971dcae4950f1e4f7021e",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/pb_house_active.svg": "3ee5efee62203fbbc40f1d0e5af71e65",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/saga_house_inactive.svg": "f244195dcd65dcde8163b61d8d9196cc",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_coins_inactive.svg": "ca9b22fbc43cb3d8df4788e95442baea",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_wallet_inactive.svg": "eb32c77996b2d3c7f9fcc65c161548d4",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_wallet_active.svg": "59fe5e3e1c5f6e6e8fb3dd49a7e9acac",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/saga_wallet_inactive.svg": "eb32c77996b2d3c7f9fcc65c161548d4",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_person_active.svg": "fc4487e0dbf0b7f4d714fa9a39421673",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_kf_inactive.svg": "48fb686bf0c52503b455382ad50ee22a",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_person_inactive.svg": "4d24dd89b1e174745db5a8c3d873dffe",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/pb_house_inactive.svg": "f244195dcd65dcde8163b61d8d9196cc",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/pb_coins_active.svg": "96c5b72f3f37c7dda6f992e3462bdbdb",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/dm_coins_inactive.svg": "93f3e8e64ef511f2450bb0f8820a1fd4",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/lm_house_active.svg": "9d49cf8e74e5fa51d76eb288e8401f06",
"assets/packages/eufemia_components/lib/assets/icons/tabbar/pb_wallet_inactive.svg": "eb32c77996b2d3c7f9fcc65c161548d4",
"assets/packages/eufemia_components/lib/assets/icons/spinner.svg": "17b4826e510dae771748cbf75675d742",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ph.svg": "4248c79c9155c7dde1aee267bb0ae5fe",
"assets/packages/eufemia_components/lib/assets/graphics/flags/se.svg": "699556b6b12cd56fa724b14ff7f5b56c",
"assets/packages/eufemia_components/lib/assets/graphics/flags/jp.svg": "aa558fc77b8596de047b6895c3ad4c48",
"assets/packages/eufemia_components/lib/assets/graphics/flags/gb.svg": "138fabd32b00a12a1bc443b4ca911a34",
"assets/packages/eufemia_components/lib/assets/graphics/flags/pk.svg": "a6ffc893d48958f5c91976018a939f71",
"assets/packages/eufemia_components/lib/assets/graphics/flags/sg.svg": "66ec618bd79d15fe732a3444f0556828",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ru.svg": "f2438d1c137bbfa4865b27a233f7798d",
"assets/packages/eufemia_components/lib/assets/graphics/flags/do.svg": "78e8f1f7dc77a3be185e0945c1b15141",
"assets/packages/eufemia_components/lib/assets/graphics/flags/kw.svg": "d4844e073b8e1fa91ae63f4f5f892bd0",
"assets/packages/eufemia_components/lib/assets/graphics/flags/il.svg": "adac1d9707848d4b75d814be192e03fc",
"assets/packages/eufemia_components/lib/assets/graphics/flags/dk.svg": "0cabc45aa6baf4fb551182d79bcd4b11",
"assets/packages/eufemia_components/lib/assets/graphics/flags/kr.svg": "f812520f27636e4aa459a29988a5f8f3",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ke.svg": "8299a65d544afcb500f31ed6629fe901",
"assets/packages/eufemia_components/lib/assets/graphics/flags/hk.svg": "dc1c3e70af4549b106601ae2bdae8c69",
"assets/packages/eufemia_components/lib/assets/graphics/flags/sa.svg": "b7752fc06b5662ddd099aa7a51d4fea2",
"assets/packages/eufemia_components/lib/assets/graphics/flags/rs.svg": "ed8946b1f3bd65f7ce00896e30a6cc74",
"assets/packages/eufemia_components/lib/assets/graphics/flags/pl.svg": "87814c05cd4fd84d0864eb0af29874cb",
"assets/packages/eufemia_components/lib/assets/graphics/flags/in.svg": "a92fafddc0b4820a10840c4f73608ddd",
"assets/packages/eufemia_components/lib/assets/graphics/flags/mv.svg": "38bde5c82aa27850f77906edcd1e82c3",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ma.svg": "4d2d4a22ab540196a022e86e61a4e2ad",
"assets/packages/eufemia_components/lib/assets/graphics/flags/nz.svg": "867cf9426da7d6a3fd4fd84756930239",
"assets/packages/eufemia_components/lib/assets/graphics/flags/au.svg": "e3a3fa119347bd8051a0f2bcb0c9f70a",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ke_test.svg": "b99d6858b39e9e0a241a884f6811daae",
"assets/packages/eufemia_components/lib/assets/graphics/flags/mu.svg": "aa745497a84be19d2a390f36fbb13b7b",
"assets/packages/eufemia_components/lib/assets/graphics/flags/tw.svg": "f58aff1c299a59135326e26c15a869c9",
"assets/packages/eufemia_components/lib/assets/graphics/flags/us.svg": "6433d6ead3183c85ebba34c531266627",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ch.svg": "b37d0ba765f13d02da37db4e4367ce94",
"assets/packages/eufemia_components/lib/assets/graphics/flags/no.svg": "ba893ca7cd761ccc071d63602d302c49",
"assets/packages/eufemia_components/lib/assets/graphics/flags/cl.svg": "e95d068ea011081f132096b74c6db535",
"assets/packages/eufemia_components/lib/assets/graphics/flags/bh.svg": "76ef50d42cc1524c5076a7e08183d379",
"assets/packages/eufemia_components/lib/assets/graphics/flags/tr.svg": "c0bd95091727fa8f3863dfa90bc13775",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ae.svg": "a8d1abdccda3510a8439052817a1241e",
"assets/packages/eufemia_components/lib/assets/graphics/flags/cz.svg": "2f6a9594211653d4b562095958178245",
"assets/packages/eufemia_components/lib/assets/graphics/flags/vn.svg": "49c0e7240e363673432c497203853945",
"assets/packages/eufemia_components/lib/assets/graphics/flags/cn.svg": "e64997f6b6a2fe5835c5fd28b4b3269b",
"assets/packages/eufemia_components/lib/assets/graphics/flags/om.svg": "ef2ba0a1cbb3477c5dafccebf033047a",
"assets/packages/eufemia_components/lib/assets/graphics/flags/bg.svg": "642b6bbe3e65ba148d14fc9f0e267878",
"assets/packages/eufemia_components/lib/assets/graphics/flags/vu.svg": "07618a7cc014c734c757bbb2248d9ed1",
"assets/packages/eufemia_components/lib/assets/graphics/flags/za.svg": "5509e22d39c2e72e26bea2b3d6cb9637",
"assets/packages/eufemia_components/lib/assets/graphics/flags/mk.svg": "613178c7123e1db57b13e29786ddf7c4",
"assets/packages/eufemia_components/lib/assets/graphics/flags/bs.svg": "258e32964e7128823b7c902ffab584c2",
"assets/packages/eufemia_components/lib/assets/graphics/flags/th.svg": "40d91027b8ea424612656a1dff54328c",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ca.svg": "bc9023949b29e957c54d59f4408fed83",
"assets/packages/eufemia_components/lib/assets/graphics/flags/br.svg": "4797ea6537729f4d2fcd8c6b0b7076a5",
"assets/packages/eufemia_components/lib/assets/graphics/flags/my.svg": "bb851d8bc3f4b990e1233b2ec93f8bda",
"assets/packages/eufemia_components/lib/assets/graphics/flags/tz.svg": "92f8c48b9b78ea00274c0b04e8cbeb36",
"assets/packages/eufemia_components/lib/assets/graphics/flags/bw.svg": "eb7a882123a59c0144eef9e5285ade9d",
"assets/packages/eufemia_components/lib/assets/graphics/flags/lk.svg": "118027aceceaadfb3c400ef5652f2494",
"assets/packages/eufemia_components/lib/assets/graphics/flags/mx.svg": "a0765e6afbb2bbc43ca730e184ef10c6",
"assets/packages/eufemia_components/lib/assets/graphics/flags/tn.svg": "4f5d41a6fb0e4352a422b8472ca09326",
"assets/packages/eufemia_components/lib/assets/graphics/flags/jo.svg": "477d1c05c4147514e1b693db4b47a28d",
"assets/packages/eufemia_components/lib/assets/graphics/flags/et.svg": "e02f3f6312f17a266d3f161d72b81b72",
"assets/packages/eufemia_components/lib/assets/graphics/flags/eu.svg": "cdbcaae1fa93d273444491f677c13c2a",
"assets/packages/eufemia_components/lib/assets/graphics/flags/hr.svg": "f32fc6f33fc94c12c48a1873a4492ddb",
"assets/packages/eufemia_components/lib/assets/graphics/flags/ro.svg": "7a09315da647f00d61f3fe5879d056ae",
"assets/packages/eufemia_components/lib/assets/graphics/flags/eg.svg": "05f4a32d9d340565554e114ab48fe51d",
"assets/packages/eufemia_components/lib/assets/graphics/flags/is.svg": "5bb461bd0a62ede93d2ae649b2c8de83",
"assets/packages/eufemia_components/lib/assets/graphics/flags/id.svg": "8eb734f19cd1dd2478a93c83905af26b",
"assets/packages/eufemia_components/lib/assets/graphics/flags/hu.svg": "4bfc2bd019c710a63472afcc69a0fe02",
"assets/packages/eufemia_components/lib/assets/graphics/flags/gm.svg": "5fa1853e18613353769eae4e16510c2b",
"assets/packages/eufemia_components/lib/assets/graphics/flags/qa.svg": "a0fbceb2f37490e92c7f105461cc1051",
"assets/packages/eufemia_components/lib/assets/graphics/cards/types/visa_metallic.svg": "55acbe869206ddcbd3919c986231784b",
"assets/packages/eufemia_components/lib/assets/graphics/cards/types/visa.svg": "451d07a01b0173275e9003f692fd61a2",
"assets/packages/eufemia_components/lib/assets/graphics/cards/types/mastercard_metallic.svg": "447a59d416ec044ea6942f1857b9e155",
"assets/packages/eufemia_components/lib/assets/graphics/cards/types/mastercard.svg": "c0f4277bfa56c061265c6e623b00a0be",
"assets/packages/eufemia_components/lib/assets/graphics/cards/types/visa_white.svg": "1783b375278a209236793425df6066bb",
"assets/packages/eufemia_components/lib/assets/graphics/cards/logos/dnb.svg": "9ceda9108ca6cf606cf2890f7fb85d80",
"assets/packages/eufemia_components/lib/assets/graphics/cards/logos/dnb_metallic.svg": "426d3fc850373b5f1adbf288bca10555",
"assets/packages/eufemia_components/lib/assets/graphics/cards/programs/saga_gold.svg": "9436ed9493f6d4e35e2bd79f38fc00b0",
"assets/packages/eufemia_components/lib/assets/graphics/cards/programs/saga_visa_platinum.svg": "4b2394e5c909b39b12fdb3a62858de30",
"assets/packages/eufemia_components/lib/assets/graphics/cards/programs/private_banking.svg": "e9b81ac861ef6605ed3d020627a0b797",
"assets/packages/eufemia_components/lib/assets/graphics/cards/programs/private_banking_visa_platinum.svg": "0e5a5cb95a27f0c72684ed06e19b00df",
"assets/packages/eufemia_components/lib/assets/graphics/cards/programs/saga_platinum.svg": "992dd57bd890d1b877b6116acfb1a1cb",
"assets/packages/eufemia_components/lib/assets/graphics/other/app_store_update.svg": "0c58389857fc0442d6e85c0fbecb474d",
"assets/packages/eufemia_components/lib/assets/graphics/other/play_store_update.svg": "80b75ab1cd9b55d1d626c2eb95918a2a",
"assets/packages/eufemia_components/lib/assets/graphics/logos/skyss.svg": "373050093d08f1bbeaa2390b22ee75c0",
"assets/packages/eufemia_components/lib/assets/graphics/logos/face_id.svg": "18dec0b43bc5b66025d1d5333f628023",
"assets/packages/eufemia_components/lib/assets/graphics/logos/bank_id_mobile.svg": "e7eb96f2f33ac47b2e5b9e7a685c488a",
"assets/packages/eufemia_components/lib/assets/graphics/logos/visa.svg": "5204b5519dce08c725c5fe0acf6c546d",
"assets/packages/eufemia_components/lib/assets/graphics/logos/ruter.svg": "e177de92514583a6f780f966dbe15fb9",
"assets/packages/eufemia_components/lib/assets/graphics/logos/bank_id.svg": "d8a50bf41570635d732d2b388daa7a34",
"assets/packages/eufemia_components/lib/assets/graphics/logos/pin.svg": "ddfc92facec508a6fc99c0a05b46679c",
"assets/packages/eufemia_components/lib/assets/graphics/logos/hbo.svg": "1c244a4856de3c83043257fb4a6fc129",
"assets/packages/eufemia_components/lib/assets/graphics/logos/dnb.svg": "9ceda9108ca6cf606cf2890f7fb85d80",
"assets/packages/eufemia_components/lib/assets/graphics/logos/spotify.svg": "b5738529b5157fec78e5f264e186fc59",
"assets/packages/eufemia_components/lib/assets/graphics/logos/mastercard.svg": "a20325ae03d3958315a0ca7c6c102db3",
"assets/packages/eufemia_components/lib/assets/graphics/logos/touch_id.svg": "11ecdc631bb7aaffb2ee4f8bbf8b1be3",
"assets/packages/eufemia_components/lib/assets/graphics/logos/digipass.svg": "0bdc9adf0aa98f947198dbf3b0c5e75e",
"assets/packages/eufemia_components/lib/assets/graphics/logos/netflix.svg": "86ed8dd28554bf4b49bd896aee8f1501",
"assets/packages/eufemia_components/assets/EufemiaIcons.ttf": "a9b5c0668c728be057e5b52852cdddd0",
"assets/packages/eufemia_typography/lib/fonts/DNBMono-BoldItalic.otf": "79e2cd0b8951be4833d7d31b6bc57df2",
"assets/packages/eufemia_typography/lib/fonts/DNBMono-Light.otf": "7f857b77838abb5ac3198506346a2223",
"assets/packages/eufemia_typography/lib/fonts/DNBMono-Medium.otf": "16e59585aafe7acf3f87232cbdefe0c8",
"assets/packages/eufemia_typography/lib/fonts/DNB-RegularItalic.otf": "20e201dc88479ceeb3b31e21822ac05c",
"assets/packages/eufemia_typography/lib/fonts/DNB-Bold.otf": "eef3e02f4f22d9add9b83f61a8742f0d",
"assets/packages/eufemia_typography/lib/fonts/DNBMono-Regular.otf": "22d26b6c20471b7a8123b7820e2501b3",
"assets/packages/eufemia_typography/lib/fonts/DNBMono-RegularItalic.otf": "0b081cb57f303c0be07073c87b100fe5",
"assets/packages/eufemia_typography/lib/fonts/DNBMono-Bold.otf": "407baa47e6065498bcf36667a88c355e",
"assets/packages/eufemia_typography/lib/fonts/DNB-Medium.otf": "4feae058ddb6621aaf95d61675548315",
"assets/packages/eufemia_typography/lib/fonts/DNB-BoldItalic.otf": "fb329055d2e2e37923bc7e109bc51b55",
"assets/packages/eufemia_typography/lib/fonts/DNBMono-LightItalic.otf": "0c720575436d906e9603b5f1d3e53720",
"assets/packages/eufemia_typography/lib/fonts/DNB-Light.otf": "072620398228a6e4729385c46a343d82",
"assets/packages/eufemia_typography/lib/fonts/DNB-LightItalic.otf": "a5ccb5b74d4ee48ef4f3434bf7d9a284",
"assets/packages/eufemia_typography/lib/fonts/DNBMono-MediumItalic.otf": "b4866e9ed5a2bb79cb30048fc9cd813c",
"assets/packages/eufemia_typography/lib/fonts/DNB-MediumItalic.otf": "b7d9dc92192ff46fbeeb5b4fd9cb73cf",
"assets/packages/eufemia_typography/lib/fonts/DNB-Regular.otf": "76f5ec86d1f79e9f4e1ff27815ab1db4",
"assets/packages/eufemia_typography/fonts/DNBMono-BoldItalic.otf": "79e2cd0b8951be4833d7d31b6bc57df2",
"assets/packages/eufemia_typography/fonts/DNBMono-Light.otf": "7f857b77838abb5ac3198506346a2223",
"assets/packages/eufemia_typography/fonts/DNBMono-Medium.otf": "16e59585aafe7acf3f87232cbdefe0c8",
"assets/packages/eufemia_typography/fonts/DNB-RegularItalic.otf": "20e201dc88479ceeb3b31e21822ac05c",
"assets/packages/eufemia_typography/fonts/DNB-Bold.otf": "eef3e02f4f22d9add9b83f61a8742f0d",
"assets/packages/eufemia_typography/fonts/DNBMono-Regular.otf": "22d26b6c20471b7a8123b7820e2501b3",
"assets/packages/eufemia_typography/fonts/DNBMono-RegularItalic.otf": "0b081cb57f303c0be07073c87b100fe5",
"assets/packages/eufemia_typography/fonts/DNBMono-Bold.otf": "407baa47e6065498bcf36667a88c355e",
"assets/packages/eufemia_typography/fonts/DNB-Medium.otf": "4feae058ddb6621aaf95d61675548315",
"assets/packages/eufemia_typography/fonts/DNB-BoldItalic.otf": "fb329055d2e2e37923bc7e109bc51b55",
"assets/packages/eufemia_typography/fonts/DNBMono-LightItalic.otf": "0c720575436d906e9603b5f1d3e53720",
"assets/packages/eufemia_typography/fonts/DNB-Light.otf": "072620398228a6e4729385c46a343d82",
"assets/packages/eufemia_typography/fonts/DNB-LightItalic.otf": "a5ccb5b74d4ee48ef4f3434bf7d9a284",
"assets/packages/eufemia_typography/fonts/DNBMono-MediumItalic.otf": "b4866e9ed5a2bb79cb30048fc9cd813c",
"assets/packages/eufemia_typography/fonts/DNB-MediumItalic.otf": "b7d9dc92192ff46fbeeb5b4fd9cb73cf",
"assets/packages/eufemia_typography/fonts/DNB-Regular.otf": "76f5ec86d1f79e9f4e1ff27815ab1db4",
"assets/packages/device_simulator/assets/appleicon.ttf": "c4dba022f47759c31be8e7c70db60b88",
"assets/packages/device_simulator/assets/ios-bar-black.png": "57e20e3db84685678aaedacf9f8b79bc",
"assets/packages/device_simulator/assets/ios-bar-white.png": "8f1b8848c5e4c95ea35f92f65883baa9",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/icons/eufemia.svg": "d36067f5fdab46b272e0ad73f61eea05"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      // Provide a no-cache param to ensure the latest version is downloaded.
      return cache.addAll(CORE.map((value) => new Request(value, {'cache': 'no-cache'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');

      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }

      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#')) {
    key = '/';
  }
  // If the URL is not the the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache. Ensure the resources are not cached
        // by the browser for longer than the service worker expects.
        var modifiedRequest = new Request(event.request, {'cache': 'no-cache'});
        return response || fetch(modifiedRequest).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data == 'skipWaiting') {
    return self.skipWaiting();
  }

  if (event.message = 'downloadOffline') {
    downloadOffline();
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
