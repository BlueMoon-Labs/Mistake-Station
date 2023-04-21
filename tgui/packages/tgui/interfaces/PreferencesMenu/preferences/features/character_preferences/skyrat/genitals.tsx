import { FeatureDropdownInput, Feature, FeatureNumberInput, CheckboxInput, FeatureTriColorInput, FeatureTriBoolInput, FeatureNumeric, FeatureToggle, FeatureChoiced } from '../../base';

export const penis_toggle: FeatureToggle = {
  name: 'Гениталии. Прицепить Пенис к телу персонажа.',
  component: CheckboxInput,
};

export const feature_penis: Feature<string> = {
  name: 'Гениталии. Тип Пениса',
  component: FeatureDropdownInput,
};

export const penis_skin_tone: FeatureToggle = {
  name: 'Гениталии. Penis uses Skin Tone',
  component: CheckboxInput,
};

export const penis_skin_color: FeatureToggle = {
  name: 'Гениталии. Penis uses Skin Color',
  component: CheckboxInput,
};

export const penis_color: Feature<string[]> = {
  name: 'Гениталии. Penis Color',
  component: FeatureTriColorInput,
};

export const penis_emissive: Feature<boolean[]> = {
  name: 'Гениталии. Penis Emissives',
  component: FeatureTriBoolInput,
};

export const penis_sheath: Feature<string> = {
  name: 'Гениталии. Penis Sheath',
  component: FeatureDropdownInput,
};

export const penis_length: FeatureNumeric = {
  name: 'Гениталии. Penis Length',
  component: FeatureNumberInput,
};

export const penis_girth: FeatureNumeric = {
  name: 'Гениталии. Penis Girth',
  component: FeatureNumberInput,
};

export const penis_taur_mode_toggle: FeatureToggle = {
  name: 'Гениталии. Penis Taur Mode',
  component: CheckboxInput,
};

export const testicles_toggle: FeatureToggle = {
  name: 'Гениталии. Прицепить Яйца.',
  component: CheckboxInput,
};

export const feature_testicles: Feature<string> = {
  name: 'Гениталии. Тип Семенников',
  component: FeatureDropdownInput,
};

export const testicles_skin_tone: FeatureToggle = {
  name: 'Гениталии. Testicles uses Skin Tone',
  component: CheckboxInput,
};

export const testicles_skin_color: FeatureToggle = {
  name: 'Гениталии. Testicles uses Skin Color',
  component: CheckboxInput,
};

export const testicles_color: Feature<string[]> = {
  name: 'Гениталии. Testicles Color',
  component: FeatureTriColorInput,
};

export const testicles_emissive: Feature<boolean[]> = {
  name: 'Гениталии. Testicles Emissives',
  component: FeatureTriBoolInput,
};

export const balls_size: FeatureNumeric = {
  name: 'Гениталии. Testicles Size',
  component: FeatureNumberInput,
};

export const vagina_toggle: FeatureToggle = {
  name: 'Гениталии. Прицепить Вагину к телу персонажа.',
  component: CheckboxInput,
};

export const feature_vagina: Feature<string> = {
  name: 'Гениталии. Тип Вагины',
  component: FeatureDropdownInput,
};

export const vagina_skin_tone: FeatureToggle = {
  name: 'Гениталии. Вагина uses Skin Tone',
  component: CheckboxInput,
};

export const vagina_skin_color: FeatureToggle = {
  name: 'Гениталии. Вагина uses Skin Color',
  component: CheckboxInput,
};

export const vagina_color: Feature<string[]> = {
  name: 'Гениталии. Цвет Вагины.',
  component: FeatureTriColorInput,
};

export const vagina_emissive: Feature<boolean[]> = {
  name: 'Гениталии. Вагина Светится.',
  component: FeatureTriBoolInput,
};

export const womb_toggle: FeatureToggle = {
  name: 'Гениталии. Прицепить Матку к телу персонажа.',
  component: CheckboxInput,
};

export const feature_womb: Feature<string> = {
  name: 'Гениталии. Тип Матки',
  component: FeatureDropdownInput,
};

export const breasts_toggle: FeatureToggle = {
  name: 'Гениталии. Прицепить Грудь к телу персонажа.',
  component: CheckboxInput,
};

export const feature_breasts: Feature<string> = {
  name: 'Гениталии. Тип Груди',
  component: FeatureDropdownInput,
};

export const breasts_skin_tone: FeatureToggle = {
  name: 'Гениталии. Breasts use Skin Tone',
  component: CheckboxInput,
};

export const breasts_skin_color: FeatureToggle = {
  name: 'Гениталии. Breasts use Skin Color',
  component: CheckboxInput,
};

export const breasts_color: Feature<string[]> = {
  name: 'Гениталии. Breast Color',
  component: FeatureTriColorInput,
};

export const breasts_emissive: Feature<boolean[]> = {
  name: 'Гениталии. Breast Emissives',
  component: FeatureTriBoolInput,
};

export const breasts_lactation_toggle: FeatureToggle = {
  name: 'Гениталии. Breast Lactation',
  component: CheckboxInput,
};

export const breasts_size: Feature<string> = {
  name: 'Гениталии. Breast Size',
  component: FeatureDropdownInput,
};

export const anus_toggle: FeatureToggle = {
  name: 'Гениталии. Прицепить Анус к телу персонажа.',
  component: CheckboxInput,
};

export const feature_anus: Feature<string> = {
  name: 'Гениталии. Тип Ануса',
  component: FeatureDropdownInput,
};

export const body_size: FeatureNumeric = {
  name: 'Body Size',
  component: FeatureNumberInput,
};

export const erp_status_pref: FeatureChoiced = {
  name: 'ERP Status',
  component: FeatureDropdownInput,
};

export const erp_status_pref_nc: FeatureChoiced = {
  name: 'ERP Non-Con Status',
  component: FeatureDropdownInput,
};

export const erp_status_pref_v: FeatureChoiced = {
  name: 'ERP Vore Status',
  component: FeatureDropdownInput,
};

export const erp_status_pref_mechanics: FeatureChoiced = {
  name: 'ERP Mechanical Status',
  component: FeatureDropdownInput,
};
