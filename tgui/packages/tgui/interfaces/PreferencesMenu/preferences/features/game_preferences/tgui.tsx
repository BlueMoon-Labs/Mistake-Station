import { CheckboxInput, FeatureToggle } from '../base';

export const tgui_fancy: FeatureToggle = {
  name: 'Включить TGUI',
  category: 'UI',
  description: 'Makes TGUI windows look better, at the cost of compatibility.',
  component: CheckboxInput,
};

export const tgui_input: FeatureToggle = {
  name: 'Инпут: Включить TGUI',
  category: 'UI',
  description: 'Renders input boxes in TGUI.',
  component: CheckboxInput,
};

export const tgui_input_large: FeatureToggle = {
  name: 'Инпут: Большие Кнопки',
  category: 'UI',
  description: 'Makes TGUI buttons less traditional, more functional.',
  component: CheckboxInput,
};

export const tgui_input_swapped: FeatureToggle = {
  name: 'Инпут: Поменять Местами Кнопки Отправки / Отмены',
  category: 'UI',
  description: 'Makes TGUI buttons less traditional, more functional.',
  component: CheckboxInput,
};

export const tgui_lock: FeatureToggle = {
  name: 'Закрепить TGUI',
  category: 'UI',
  description: 'Locks TGUI windows to your main monitor.',
  component: CheckboxInput,
};

export const tgui_say_light_mode: FeatureToggle = {
  name: 'Говорить: Светлый Режим',
  category: 'UI',
  description: 'Sets TGUI Say to use a light mode.',
  component: CheckboxInput,
};
