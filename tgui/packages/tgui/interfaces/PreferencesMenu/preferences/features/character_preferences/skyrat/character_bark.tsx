import { FeatureChoiced, FeatureNumberInput, CheckboxInput, FeatureDropdownInput, FeatureNumeric, FeatureToggle } from '../../base';

export const character_bark: FeatureChoiced = {
  name: 'Персонаж — Предпочитаемый Голос. Тип',
  component: FeatureDropdownInput,
};

export const bark_speed: FeatureNumeric = {
  name: 'Персонаж — Предпочитаемый Голос. Скорость',
  component: FeatureNumberInput,
};

export const bark_pitch: FeatureNumeric = {
  name: 'Персонаж — Предпочитаемый Голос. Тембр',
  component: FeatureNumberInput,
};

export const vocal_pitch_range: FeatureNumeric = {
  name: 'Персонаж — Предпочитаемый Голос. Подача',
  component: FeatureNumberInput,
};

export const bark_preview: FeatureToggle = {
  name: 'Персонаж — Предпочитаемый Голос. Прослушать',
  component: CheckboxInput,
};
