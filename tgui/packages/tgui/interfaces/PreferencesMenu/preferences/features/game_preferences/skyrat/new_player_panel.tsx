import { FeatureToggle, CheckboxInput } from '../../base';

export const use_new_playerpanel: FeatureToggle = {
  name: 'Использовать Крутую Игровую Панель',
  category: 'ADMIN',
  description:
    'Когда включено, можно использовать Крутую Игровую Панель. Very Easy To Use.',
  component: CheckboxInput,
};
