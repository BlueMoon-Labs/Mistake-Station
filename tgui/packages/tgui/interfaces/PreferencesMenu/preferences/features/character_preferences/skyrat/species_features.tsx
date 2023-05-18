import { FeatureChoiced, FeatureDropdownInput, Feature, FeatureColorInput, FeatureTextInput, FeatureShortTextInput, CheckboxInput, FeatureTriColorInput, FeatureTriBoolInput, FeatureToggle, FeatureNumberInput, FeatureValueProps, FeatureChoicedServerData } from '../../base';

export const feature_leg_type: FeatureChoiced = {
  name: 'Тип Ног',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_mcolor2: Feature<string> = {
  name: 'Вторичный Цвет Тела',
  component: FeatureColorInput,
};
export const feature_mcolor3: Feature<string> = {
  name: 'Третьичный Цвет Тела',
  component: FeatureColorInput,
};

export const flavor_text: Feature<string> = {
  name: 'Описание Персонажа',
  description: 'Describe your character!',
  component: FeatureTextInput,
};

export const silicon_flavor_text: Feature<string> = {
  name: 'Описание Персонажа для Силиконов',
  description: 'Describe your cyborg/AI shell!',
  component: FeatureTextInput,
};

export const ooc_notes: Feature<string> = {
  name: 'Описание персонажа — ООС-записи',
  description: 'Talk about your character OOCly!',
  component: FeatureTextInput,
};

export const custom_species: Feature<string> = {
  name: 'Особое Название Расы Вашего Персонажа',
  description:
    "Want to have a fancy species name? Put it here, or leave it blank if you want to use your species' default name.",
  component: FeatureShortTextInput,
};

export const custom_species_lore: Feature<string> = {
  name: 'Особая Предыстория Вашего Персонажа',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: FeatureTextInput,
};
// SKYRAT EDIT ADDITION BEGIN -- RECORDS REJUVINATION
export const general_record: Feature<string> = {
  name: 'Записи - Основные',
  description:
    'Your general records! These are records that are for general viewing-things like employment, qualifications, etc. By default, anyone with a HUD/records access can view these.',
  component: FeatureTextInput,
};

export const security_record: Feature<string> = {
  name: 'Записи - Служба Безопасности',
  description:
    'Your security records! These are records for criminal records, arrest history, things like that. Sec officers can view these.',
  component: FeatureTextInput,
};

export const medical_record: Feature<string> = {
  name: 'Записи - Медицинские',
  description:
    'Your medical records! These are records for things like medical history, prescriptions, DNR orders, etc. Medical staff can view these.',
  component: FeatureTextInput,
};

export const exploitable_info: Feature<string> = {
  name: 'Записи - Используемое Антагонистами',
  description:
    "This section is for information antagonists can use, IN CHARACTER AND OUT. If you are willing to be disrupted by antagonists MORE than the average player (this is usually a very fun experience, if you're into that kind of roleplay), put it here! Also for things antagonists can use against your character.",
  component: FeatureTextInput,
};

export const pda_ringer: Feature<string> = {
  name: 'КПК — Предпочитаемый Рингтон',
  description:
    'Want your PDA to say something other than "beep"? Accepts the first 20 characters.',
  component: FeatureShortTextInput,
};

export const background_info: Feature<string> = {
  name: 'Записи - Предыстория(?)',
  description: 'nobody uses this lmao',
  component: FeatureTextInput,
};
// SKYRAT EDIT END
export const allow_mismatched_parts_toggle: FeatureToggle = {
  name: 'Допустить Использование Дополнительных Частей',
  description:
    'Want to go completely crazy with your character design? Use this to select any parts from any species!',
  component: CheckboxInput,
};

export const allow_genitals_toggle: FeatureToggle = {
  name: 'Допустить Использование Половых Органов',
  description: 'Enables if you want to have genitals on your character.',
  component: CheckboxInput,
};

export const allow_add_genitals_toggle: FeatureToggle = {
  name: 'Допустить Использование Доп. Половых Органов',
  description: 'Enables if you want to have genitals on your character.',
  component: CheckboxInput,
};

export const allow_emissives_toggle: FeatureToggle = {
  name: 'Допустить Свечение Органов',
  description: 'Time to become a glowstick.',
  component: CheckboxInput,
};

export const eye_emissives: FeatureToggle = {
  name: 'Допустить Свечение Глаз',
  description: 'Turn your eyes into sparklers.',
  component: CheckboxInput,
};

export const mutant_colors_color: Feature<string[]> = {
  name: 'Первичный Цвет Тела',
  description: 'Legacy colors for controlling shit.',
  component: FeatureTriColorInput,
};

export const body_markings_toggle: FeatureToggle = {
  name: 'Маркировка На Теле',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_body_markings: Feature<string> = {
  name: 'Маркировка На Теле. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const body_markings_color: Feature<string[]> = {
  name: 'Маркировка На Теле. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const body_markings_emissive: Feature<boolean[]> = {
  name: 'Маркировка На Теле. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const tail_toggle: FeatureToggle = {
  name: 'Хвост',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_tail: Feature<string> = {
  name: 'Хвост. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const tail_color: Feature<string[]> = {
  name: 'Хвост. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const tail_emissive: Feature<boolean[]> = {
  name: 'Хвост. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const snout_toggle: FeatureToggle = {
  name: 'Морда',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_snout: Feature<string> = {
  name: 'Морда. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const snout_color: Feature<string[]> = {
  name: 'Морда. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const snout_emissive: Feature<boolean[]> = {
  name: 'Морда. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const horns_toggle: FeatureToggle = {
  name: 'Рога',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_horns: Feature<string> = {
  name: 'Рога. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const horns_color: Feature<string[]> = {
  name: 'Рога. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const horns_emissive: Feature<boolean[]> = {
  name: 'Рога. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const ears_toggle: FeatureToggle = {
  name: 'Уши',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_ears: Feature<string> = {
  name: 'Уши. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ears_color: Feature<string[]> = {
  name: 'Уши. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const ears_emissive: Feature<boolean[]> = {
  name: 'Уши. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const wings_toggle: FeatureToggle = {
  name: 'Крылья',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_wings: Feature<string> = {
  name: 'Крылья. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const wings_color: Feature<string[]> = {
  name: 'Крылья. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const wings_emissive: Feature<boolean[]> = {
  name: 'Крылья. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const frills_toggle: FeatureToggle = {
  name: 'Кожаный Воротник',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_frills: Feature<string> = {
  name: 'Кожаный Воротник. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const frills_color: Feature<string[]> = {
  name: 'Кожаный Воротник. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const frills_emissive: Feature<boolean[]> = {
  name: 'Кожаный Воротник. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const spines_toggle: FeatureToggle = {
  name: 'Крутой Позвоночник',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_spines: Feature<string> = {
  name: 'Крутой Позвоночник. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const spines_color: Feature<string[]> = {
  name: 'Крутой Позвоночник. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const spines_emissive: Feature<boolean[]> = {
  name: 'Крутой Позвоночник. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const digitigrade_legs: FeatureChoiced = {
  name: 'Ноги',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const caps_toggle: FeatureToggle = {
  name: 'Шляпка',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_caps: Feature<string> = {
  name: 'Шляпка. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const caps_color: Feature<string[]> = {
  name: 'Шляпка. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const caps_emissive: Feature<boolean[]> = {
  name: 'Шляпка. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const moth_antennae_toggle: FeatureToggle = {
  name: 'Моль - Антенна',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_moth_antennae: Feature<string> = {
  name: 'Моль - Антенна. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const moth_antennae_color: Feature<string[]> = {
  name: 'Моль - Антенна. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const moth_antennae_emissive: Feature<boolean[]> = {
  name: 'Моль - Антенна. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const moth_markings_toggle: FeatureToggle = {
  name: 'Моль - Маркировка',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_moth_markings: Feature<string> = {
  name: 'Моль - Маркировка. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const moth_markings_color: Feature<string[]> = {
  name: 'Моль - Маркировка. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const moth_markings_emissive: Feature<boolean[]> = {
  name: 'Моль - Маркировка. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const fluff_toggle: FeatureToggle = {
  name: 'Пушистость',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_fluff: Feature<string> = {
  name: 'Пушистость. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const fluff_color: Feature<string[]> = {
  name: 'Пушистость. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const fluff_emissive: Feature<boolean[]> = {
  name: 'Пушистость. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const head_acc_toggle: FeatureToggle = {
  name: 'Голова - Дополнительные Части',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_head_acc: Feature<string> = {
  name: 'Голова - Дополнительные Части. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const head_acc_color: Feature<string[]> = {
  name: 'Голова - Дополнительные Части. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const head_acc_emissive: Feature<boolean[]> = {
  name: 'Голова - Дополнительные Части. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const feature_ipc_screen: Feature<string> = {
  name: 'Экран IPC. Выбор',
  description:
    'The screen you wish to have displayed. If you have this set to "None", you won\'t get any screen at all.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_screen_color: Feature<string> = {
  name: 'Экран IPC. Color',
  description:
    "If your screen is greyscale enabled, then it'll take on this color.",
  component: FeatureColorInput,
};

export const ipc_screen_emissive: Feature<boolean> = {
  name: 'Экран IPC. Emissive',
  description: 'Want your screen to glow in the dark?',
  component: CheckboxInput,
};

export const ipc_antenna_toggle: FeatureToggle = {
  name: 'Синт - Антенна',
  description: 'Want an antenna?',
  component: CheckboxInput,
};

export const feature_ipc_antenna: Feature<string> = {
  name: 'Синт - Антенна. Выбор',
  description: 'The antenna you want attached to your head.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_antenna_color: Feature<string[]> = {
  name: 'Синт - Антенна. Цвет',
  description:
    'The color you want your antenna to be. Some support multiple colors.',
  component: FeatureTriColorInput,
};

export const ipc_antenna_emissive: Feature<boolean[]> = {
  name: 'Синт - Антенна. Свечение',
  description: 'Want your antenna to glow in the dark?.',
  component: FeatureTriBoolInput,
};

export const feature_ipc_chassis: Feature<string> = {
  name: 'Синт - Ходовая Часть. Выбор',
  description:
    "Allows customization of an Synth's chassis! Only works for Synths.",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_chassis_color: Feature<string> = {
  name: 'Синт - Ходовая Часть. Цвет',
  description:
    "Allows customization of an Synth's chassis! Only works for Synths, for chassis that support greyscale coloring.",
  component: FeatureColorInput,
};

export const feature_ipc_head: Feature<string> = {
  name: 'Синт - Голова. Выбор',
  description:
    "Allows customization of an Synth's chassis! Only works for Synths.",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_head_color: Feature<string> = {
  name: 'Синт - Голова. Цвет',
  description:
    "Allows customization of an Synth's head! Only works for Synths, for heads that support greyscale coloring.",
  component: FeatureColorInput,
};

export const feature_hair_opacity_toggle: Feature<boolean> = {
  name: 'Растительность на Голове - Непрозрачность',
  description: 'Enable the ability to override your hair opacity!',
  component: CheckboxInput,
};

export const feature_hair_opacity: Feature<number> = {
  name: 'Растительность на Голове - Непрозрачность',
  description: 'Change your hair opacity! Hardlight hair, anyone?',
  component: FeatureNumberInput,
};

export const neck_acc_toggle: FeatureToggle = {
  name: 'Шея - Дополнительные Части',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_neck_acc: Feature<string> = {
  name: 'Шея - Дополнительные Части. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const neck_acc_color: Feature<string[]> = {
  name: 'Шея - Дополнительные Части. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const neck_acc_emissive: Feature<boolean[]> = {
  name: 'Шея - Дополнительные Части. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const skrell_hair_toggle: FeatureToggle = {
  name: 'Скрелльская Причёска',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_skrell_hair: Feature<string> = {
  name: 'Скрелльская Причёска. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const skrell_hair_color: Feature<string[]> = {
  name: 'Скрелльская Причёска. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const skrell_hair_emissive: Feature<boolean[]> = {
  name: 'Скрелльская Причёска. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const taur_toggle: FeatureToggle = {
  name: 'Тавр',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_taur: Feature<string> = {
  name: 'Тавр. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const taur_color: Feature<string[]> = {
  name: 'Тавр. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const taur_emissive: Feature<boolean[]> = {
  name: 'Тавр. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const xenodorsal_toggle: FeatureToggle = {
  name: 'Ксеноморф - Крутой Позвоночник',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_xenodorsal: Feature<string> = {
  name: 'Ксеноморф - Крутой Позвоночник. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const xenodorsal_color: Feature<string[]> = {
  name: 'Ксеноморф - Крутой Позвоночник. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const xenodorsal_emissive: Feature<boolean[]> = {
  name: 'Ксеноморф - Крутой Позвоночник. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const xenohead_toggle: FeatureToggle = {
  name: 'Ксеноморф - Голова',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_xenohead: Feature<string> = {
  name: 'Ксеноморф - Голова Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const xenohead_color: Feature<string[]> = {
  name: 'Ксеноморф - Голова. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const xenohead_emissive: Feature<boolean[]> = {
  name: 'Ксеноморф - Голова. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const undershirt_color: Feature<string> = {
  name: 'Цвет Рубашки',
  component: FeatureColorInput,
};

export const socks_color: Feature<string> = {
  name: 'Цвет Носков',
  component: FeatureColorInput,
};

export const heterochromia_toggle: FeatureToggle = {
  name: 'Глаза - Гетерохромия',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_heterochromia: Feature<string> = {
  name: 'Глаза - Гетерохромия. Выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const heterochromia_color: Feature<string[]> = {
  name: 'Глаза - Гетерохромия. Цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const heterochromia_emissive: Feature<boolean[]> = {
  name: 'Глаза - Гетерохромия. Свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const vox_bodycolor: Feature<string> = {
  name: 'Цвет Тела Вокса',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};
