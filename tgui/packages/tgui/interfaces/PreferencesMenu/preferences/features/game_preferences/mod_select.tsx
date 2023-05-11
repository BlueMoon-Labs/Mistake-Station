import { Feature, FeatureDropdownInput } from '../base';

export const mod_select: Feature<string> = {
  name: 'MOD Активная Клавиша Модуля',
  category: 'GAMEPLAY',
  description: 'The key you need to use an active MODsuit module.',
  component: FeatureDropdownInput,
};
