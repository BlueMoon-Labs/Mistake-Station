import { multiline } from 'common/string';
import { Feature, FeatureDropdownInput } from '../base';

export const preferred_map: Feature<string> = {
  name: 'Предпочитаемая Карта',
  category: 'GAMEPLAY',
  description: multiline`
    During map rotation, prefer this map be chosen.
    This does not affect the map vote, only random rotation when a vote
    is not held.
  `,
  component: FeatureDropdownInput,
};
