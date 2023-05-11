import { multiline } from 'common/string';
import { CheckboxInput, FeatureToggle } from '../base';

export const darkened_flash: FeatureToggle = {
  name: 'Включить Затемненные Вспышки',
  category: 'GAMEPLAY',
  description: multiline`
    When toggled, being flashed will show a dark screen rather than a
    bright one.
  `,
  component: CheckboxInput,
};
