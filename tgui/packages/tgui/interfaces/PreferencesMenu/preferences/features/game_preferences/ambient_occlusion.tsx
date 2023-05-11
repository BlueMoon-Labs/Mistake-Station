import { CheckboxInput, FeatureToggle } from '../base';

export const ambientocclusion: FeatureToggle = {
  name: 'Включить Звуки Окружающего Пространства',
  category: 'GAMEPLAY',
  description: 'Enable ambient occlusion, light shadows around characters.',
  component: CheckboxInput,
};
