import { CheckboxInput, FeatureToggle } from '../base';

export const typingIndicator: FeatureToggle = {
  name: 'Включить Индикаторы Набора Текста Для Себя',
  category: 'GAMEPLAY',
  description: "Enable typing indicators that show you're typing a message.",
  component: CheckboxInput,
};
