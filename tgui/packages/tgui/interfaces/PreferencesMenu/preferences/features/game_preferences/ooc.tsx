import { FeatureColorInput, Feature } from '../base';

export const ooccolor: Feature<string> = {
  name: 'Цвет Имени в ООС',
  category: 'CHAT',
  description: 'The color of your OOC messages.',
  component: FeatureColorInput,
};
