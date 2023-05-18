import { FeatureDropdownInput, Feature, FeatureNumberInput, FeatureNumeric, FeatureChoiced } from '../../base';

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
