import { CheckboxInput, FeatureToggle } from '../../base';

export const delete_sparks_pref: FeatureToggle = {
  name: 'Удалить Искры',
  category: 'ADMIN',
  description:
    'Toggles if you want to play a sparking animation when deleting things as an admin.',
  component: CheckboxInput,
};
