import { Feature, FeatureChoiced, FeatureDropdownInput, FeatureShortTextInput } from '../base';

export const pda_theme: FeatureChoiced = {
  name: 'КПК — Внешность ОС',
  category: 'GAMEPLAY',
  description: 'The theme of your PDA.',
  component: FeatureDropdownInput,
};

export const pda_ringtone: Feature<string> = {
  name: 'КПК — Рингтон',
  description: "The ringtone you'll hear when someone sends you a PDA message.",
  component: FeatureShortTextInput,
};
