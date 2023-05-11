import { createDropdownInput, Feature } from '../base';

export const multiz_performance: Feature<number> = {
  name: 'Мульти-Z Параллакс. Детальность',
  category: 'GAMEPLAY',
  description: 'How detailed multi-z is. Lower this to improve performance',
  component: createDropdownInput({
    [-1]: 'Standard',
    2: 'High',
    1: 'Medium',
    0: 'Low',
  }),
};
