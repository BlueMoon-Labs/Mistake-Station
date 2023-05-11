import { multiline } from 'common/string';
import { CheckboxInput, FeatureToggle } from '../base';

export const windowflashing: FeatureToggle = {
  name: 'Включить Мигание Окна',
  category: 'UI',
  description: multiline`
    When toggled, some important events will make your game icon flash on your
    task tray.
  `,
  component: CheckboxInput,
};
