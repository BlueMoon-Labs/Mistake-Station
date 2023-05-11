import { Feature, FeatureColorInput } from '../base';

export const paint_color: Feature<string> = {
  name: 'Спрей — Предпочитаемый Цвет',
  component: FeatureColorInput,
};
