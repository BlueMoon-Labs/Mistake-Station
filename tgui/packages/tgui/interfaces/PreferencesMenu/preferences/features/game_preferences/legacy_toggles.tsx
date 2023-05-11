import { multiline } from 'common/string';
import { FeatureToggle, CheckboxInput, CheckboxInputInverse } from '../base';

export const admin_ignore_cult_ghost: FeatureToggle = {
  name: 'Предотвратить вызов Призрака Культа',
  category: 'ADMIN',
  description: multiline`
    When enabled and observing, prevents Spirit Realm from forcing you
    into a cult ghost.
  `,
  component: CheckboxInput,
};

export const announce_login: FeatureToggle = {
  name: 'Объявлять о входе Администрации в Систему',
  category: 'ADMIN',
  description: 'Admins will be notified when you login.',
  component: CheckboxInput,
};

export const combohud_lighting: FeatureToggle = {
  name: 'Включить полноцветный комбо HUD',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const deadmin_always: FeatureToggle = {
  name: 'Авто-Деадмин - Всегда',
  category: 'ADMIN',
  description: 'When enabled, you will automatically deadmin.',
  component: CheckboxInput,
};

export const deadmin_antagonist: FeatureToggle = {
  name: 'Авто-Деадмин - При Антагонизме',
  category: 'ADMIN',
  description: 'When enabled, you will automatically deadmin as an antagonist.',
  component: CheckboxInput,
};

export const deadmin_position_head: FeatureToggle = {
  name: 'Авто-Деадмин - При игре за Глав',
  category: 'ADMIN',
  description:
    'When enabled, you will automatically deadmin as a head of staff.',
  component: CheckboxInput,
};

export const deadmin_position_security: FeatureToggle = {
  name: 'Авто-Деадмин - При игре за СБ',
  category: 'ADMIN',
  description:
    'When enabled, you will automatically deadmin as a member of security.',
  component: CheckboxInput,
};

export const deadmin_position_silicon: FeatureToggle = {
  name: 'Авто-Деадмин - При игре за Силиконов',
  category: 'ADMIN',
  description: 'When enabled, you will automatically deadmin as a silicon.',
  component: CheckboxInput,
};

export const disable_arrivalrattle: FeatureToggle = {
  name: 'Уведомлять о Новых Сотрудниках',
  category: 'GHOST',
  description: 'When enabled, you will be notified as a ghost for new crew.',
  component: CheckboxInputInverse,
};

export const disable_deathrattle: FeatureToggle = {
  name: 'Уведомлять о Смертях',
  category: 'GHOST',
  description:
    'When enabled, you will be notified as a ghost whenever someone dies.',
  component: CheckboxInputInverse,
};

export const member_public: FeatureToggle = {
  name: 'Рекламировать членство в BYOND',
  category: 'CHAT',
  description:
    'When enabled, a BYOND logo will be shown next to your name in OOC.',
  component: CheckboxInput,
};

export const sound_adminhelp: FeatureToggle = {
  name: 'Включить Админ-Звуки',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const sound_prayers: FeatureToggle = {
  name: 'Включить Звук Молитвы',
  category: 'ADMIN',
  component: CheckboxInput,
};

export const split_admin_tabs: FeatureToggle = {
  name: 'Разделить Вкладки Администратора',
  category: 'ADMIN',
  description: "When enabled, will split the 'Admin' panel into several tabs.",
  component: CheckboxInput,
};
