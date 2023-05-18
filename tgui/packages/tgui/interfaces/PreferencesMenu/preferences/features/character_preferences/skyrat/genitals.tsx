import { FeatureDropdownInput, Feature, FeatureNumberInput, CheckboxInput, FeatureTriColorInput, FeatureTriBoolInput, FeatureNumeric, FeatureToggle, FeatureChoiced } from '../../base';

export const feature_penis: Feature<string> = {
  name: 'Половые Органы. Пенис. Тип',
  component: FeatureDropdownInput,
};

export const penis_skin_tone: FeatureToggle = {
  name: 'Половые Органы. Пенис. Под цвет кожи',
  component: CheckboxInput,
};

export const penis_skin_color: FeatureToggle = {
  name: 'Половые Органы. Пенис. Под цвет тела',
  component: CheckboxInput,
};

export const penis_color: Feature<string[]> = {
  name: 'Половые Органы. Пенис. Цвет',
  component: FeatureTriColorInput,
};

export const penis_emissive: Feature<boolean[]> = {
  name: 'Половые Органы. Пенис. Светится',
  component: FeatureTriBoolInput,
};

export const penis_sheath: Feature<string> = {
  name: 'Половые Органы. Пенис. Чехольчик',
  component: FeatureDropdownInput,
};

export const penis_length: FeatureNumeric = {
  name: 'Половые Органы. Пенис. Длина',
  component: FeatureNumberInput,
};

export const penis_girth: FeatureNumeric = {
  name: 'Половые Органы. Пенис. Ширина',
  component: FeatureNumberInput,
};

export const penis_taur_mode_toggle: FeatureToggle = {
  name: 'Половые Органы. Пенис для Тавров',
  component: CheckboxInput,
};

export const feature_testicles: Feature<string> = {
  name: 'Половые Органы. Семенники. Тип',
  component: FeatureDropdownInput,
};

export const testicles_skin_tone: FeatureToggle = {
  name: 'Половые Органы. Семенники. Под цвет кожи',
  component: CheckboxInput,
};

export const testicles_skin_color: FeatureToggle = {
  name: 'Половые Органы. Семенники. Под цвет тела',
  component: CheckboxInput,
};

export const testicles_color: Feature<string[]> = {
  name: 'Половые Органы. Семенники. Цвет',
  component: FeatureTriColorInput,
};

export const testicles_emissive: Feature<boolean[]> = {
  name: 'Половые Органы. Семенники светятся',
  component: FeatureTriBoolInput,
};

export const balls_size: FeatureNumeric = {
  name: 'Половые Органы. Семенники. Размер',
  component: FeatureNumberInput,
};

export const feature_vagina: Feature<string> = {
  name: 'Половые Органы. Вагина. Тип',
  component: FeatureDropdownInput,
};

export const vagina_skin_tone: FeatureToggle = {
  name: 'Половые Органы. Вагина. Под цвет кожи',
  component: CheckboxInput,
};

export const vagina_skin_color: FeatureToggle = {
  name: 'Половые Органы. Вагина. Под цвет тела',
  component: CheckboxInput,
};

export const vagina_color: Feature<string[]> = {
  name: 'Половые Органы. Вагина. Цвет',
  component: FeatureTriColorInput,
};

export const vagina_emissive: Feature<boolean[]> = {
  name: 'Половые Органы. Вагина Светится',
  component: FeatureTriBoolInput,
};

export const feature_womb: Feature<string> = {
  name: 'Половые Органы. Матка. Тип',
  component: FeatureDropdownInput,
};

export const feature_breasts: Feature<string> = {
  name: 'Половые Органы. Грудь. Тип',
  component: FeatureDropdownInput,
};

export const breasts_skin_tone: FeatureToggle = {
  name: 'Половые Органы. Грудь. Под цвет кожи',
  component: CheckboxInput,
};

export const breasts_skin_color: FeatureToggle = {
  name: 'Половые Органы. Грудь. Под цвет тела',
  component: CheckboxInput,
};

export const breasts_color: Feature<string[]> = {
  name: 'Половые Органы. Грудь. Цвет',
  component: FeatureTriColorInput,
};

export const breasts_emissive: Feature<boolean[]> = {
  name: 'Половые Органы. Грудь светится',
  component: FeatureTriBoolInput,
};

export const breasts_lactation_toggle: FeatureToggle = {
  name: 'Половые Органы. Грудь. Лактация',
  component: CheckboxInput,
};

export const breasts_size: Feature<string> = {
  name: 'Половые Органы. Грудь. Размер',
  component: FeatureDropdownInput,
};

export const feature_anus: Feature<string> = {
  name: 'Половые Органы. Анус. Тип',
  component: FeatureDropdownInput,
};

export const feature_butt: Feature<string> = {
  name: 'Половые Органы. Попа. Тип',
  component: FeatureDropdownInput,
};

export const butt_size: FeatureNumeric = {
  name: 'Половые Органы. Попа. Размер',
  component: FeatureNumberInput,
};

export const feature_belly: Feature<string> = {
  name: 'Половые Органы. Живот. Тип',
  component: FeatureDropdownInput,
};

export const belly_size: FeatureNumeric = {
  name: 'Половые Органы. Живот. Размер',
  component: FeatureNumberInput,
};

export const body_size: FeatureNumeric = {
  name: 'Размер Тела Персонажа',
  component: FeatureNumberInput,
};

export const erp_status_pref: FeatureChoiced = {
  name: 'ЕРП Статус',
  component: FeatureDropdownInput,
};

export const erp_status_pref_nc: FeatureChoiced = {
  name: 'ЕРП Нонкон-Статус',
  component: FeatureDropdownInput,
};

export const erp_status_pref_v: FeatureChoiced = {
  name: 'ЕРП Вор-Статус',
  component: FeatureDropdownInput,
};

export const erp_status_pref_mechanics: FeatureChoiced = {
  name: 'ЕРП Механика-Статус',
  component: FeatureDropdownInput,
};
