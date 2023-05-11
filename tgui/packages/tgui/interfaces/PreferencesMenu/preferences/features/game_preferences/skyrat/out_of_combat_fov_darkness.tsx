import { Feature, FeatureNumberInput } from '../../base';

export const out_of_combat_fov_darkness: Feature<number> = {
  name: 'FOB вне Боя',
  category: 'GAMEPLAY',
  component: FeatureNumberInput,
};
