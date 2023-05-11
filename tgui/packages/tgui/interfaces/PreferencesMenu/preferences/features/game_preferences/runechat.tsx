import { CheckboxInput, FeatureNumberInput, FeatureNumeric, FeatureToggle } from '../base';

export const chat_on_map: FeatureToggle = {
  name: 'Рунчат. Включить',
  category: 'RUNECHAT',
  description: 'Chat messages will show above heads.',
  component: CheckboxInput,
};

export const see_chat_non_mob: FeatureToggle = {
  name: 'Рунчат. На Объектах',
  category: 'RUNECHAT',
  description: 'Chat messages will show above objects when they speak.',
  component: CheckboxInput,
};

export const see_rc_emotes: FeatureToggle = {
  name: 'Рунчат. На Действия',
  category: 'RUNECHAT',
  description: 'Emotes will show above heads.',
  component: CheckboxInput,
};

export const max_chat_length: FeatureNumeric = {
  name: 'Рунчат. Максимальный Размер',
  category: 'RUNECHAT',
  description: 'The maximum length a Runechat message will show as.',
  component: FeatureNumberInput,
};
