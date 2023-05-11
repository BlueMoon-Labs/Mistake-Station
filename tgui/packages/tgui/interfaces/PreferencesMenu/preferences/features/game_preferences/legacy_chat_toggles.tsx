import { multiline } from 'common/string';
import { FeatureToggle, CheckboxInput } from '../base';

export const chat_bankcard: FeatureToggle = {
  name: 'Включить Обновление Доходов',
  category: 'CHAT',
  description: 'Receive notifications for your bank account.',
  component: CheckboxInput,
};

export const chat_dead: FeatureToggle = {
  name: 'Включить Чат Мёртвых',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const chat_ghostears: FeatureToggle = {
  name: 'Призрак. Слышать Все Сообщения',
  category: 'GHOST',
  description: multiline`
    When enabled, you will be able to hear all speech as a ghost.
    When disabled, you will only be able to hear nearby speech.
  `,
  component: CheckboxInput,
};

export const chat_ghostlaws: FeatureToggle = {
  name: 'Призрак. Включить Обновление Изменений в Законах ИИ',
  category: 'GHOST',
  description: 'When enabled, be notified of any new law changes as a ghost.',
  component: CheckboxInput,
};

export const chat_ghostpda: FeatureToggle = {
  name: 'Призрак. Включить уведомления на КПК',
  category: 'GHOST',
  description: 'When enabled, be notified of any PDA messages as a ghost.',
  component: CheckboxInput,
};

export const chat_ghostradio: FeatureToggle = {
  name: 'Призрак. Включить Радио',
  category: 'GHOST',
  description: 'When enabled, be notified of any radio messages as a ghost.',
  component: CheckboxInput,
};

export const chat_ghostsight: FeatureToggle = {
  name: 'Призрак. Видеть все Действия',
  category: 'GHOST',
  description: 'When enabled, see all emotes as a ghost.',
  component: CheckboxInput,
};

export const chat_ghostwhisper: FeatureToggle = {
  name: 'Призрак. Слышать Любой Шёпот',
  category: 'GHOST',
  description: multiline`
    When enabled, you will be able to hear all whispers as a ghost.
    When disabled, you will only be able to hear nearby whispers.
  `,
  component: CheckboxInput,
};

export const chat_login_logout: FeatureToggle = {
  name: 'Получать Уведомления о Входе/Выходе',
  category: 'GHOST',
  description: 'When enabled, be notified when a player logs in or out.',
  component: CheckboxInput,
};

export const chat_ooc: FeatureToggle = {
  name: 'Включить ООС',
  category: 'CHAT',
  component: CheckboxInput,
};

export const chat_prayer: FeatureToggle = {
  name: 'Слышать Молитвы',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const chat_pullr: FeatureToggle = {
  name: 'Включить уведомления о ПР',
  category: 'CHAT',
  description: 'Be notified when a pull request is made, closed, or merged.',
  component: CheckboxInput,
};
