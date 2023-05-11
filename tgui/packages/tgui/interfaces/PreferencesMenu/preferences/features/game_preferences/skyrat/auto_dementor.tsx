import { FeatureToggle, CheckboxInput } from '../../base';

export const auto_dementor_pref: FeatureToggle = {
  name: 'Авто-Дементор',
  category: 'ADMIN',
  description: 'When enabled, you will automatically dementor.',
  component: CheckboxInput,
};
