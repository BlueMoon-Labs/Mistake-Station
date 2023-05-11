import { multiline } from 'common/string';
import { CheckboxInput, Feature, FeatureNumberInput, FeatureToggle } from '../base';

export const enable_tips: FeatureToggle = {
  name: 'Включить Всплывающие Подсказки',
  category: 'TOOLTIPS',
  description: multiline`
    Do you want to see tooltips when hovering over items?
  `,
  component: CheckboxInput,
};

export const tip_delay: Feature<number> = {
  name: 'Включить Всплывающие Подсказки. Задержка (мс)',
  category: 'TOOLTIPS',
  description: multiline`
    How long should it take to see a tooltip when hovering over items?
  `,
  component: FeatureNumberInput,
};
