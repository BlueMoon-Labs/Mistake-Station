import { CheckboxInput, FeatureToggle } from '../../base';

export const be_antag_pref: FeatureToggle = {
  name: 'Быть Антагонистом',
  category: 'GAMEPLAY',
  description: 'Toggles whether you wish to be an antagonist or not.',
  component: CheckboxInput,
};
