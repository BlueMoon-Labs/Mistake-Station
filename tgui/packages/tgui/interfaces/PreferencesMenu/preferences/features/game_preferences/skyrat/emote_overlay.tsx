import { CheckboxInput, FeatureToggle } from '../../base';

export const do_emote_overlay: FeatureToggle = {
  name: 'Показать/Скрыть наложения моих эффектов эмоций',
  category: 'CHAT',
  description:
    'This shows/hides the animated overlays displayed on emotes for yourself.',
  component: CheckboxInput,
};
