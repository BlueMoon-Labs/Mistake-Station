import { CheckboxInput, FeatureDropdownInput, FeatureChoiced, FeatureToggle } from '../../base';

export const master_erp_pref: FeatureToggle = {
  name: 'Показать / Скрыть Предпочтения в эротических ролевых играх',
  category: 'ERP',
  description: 'This shows/hides ERP preferences.',
  component: CheckboxInput,
};

export const erp_pref: FeatureToggle = {
  name: 'Эротическое Ролевое Взаимодействие',
  category: 'ERP',
  description: 'This informs players of if you wish to engage in ERP.',
  component: CheckboxInput,
};

export const bimbofication_pref: FeatureToggle = {
  name: 'Бимбофикация',
  category: 'ERP',
  description:
    'Toggles if you are able to react to the effects of bimbofication.',
  component: CheckboxInput,
};

export const aphro_pref: FeatureToggle = {
  name: 'Афродизиаки',
  category: 'ERP',
  description:
    'Toggles whether you wish to recieve the effects of aphrodisiacs',
  component: CheckboxInput,
};

export const sextoy_pref: FeatureToggle = {
  name: 'Взаимодействие с Секс-Игрушками',
  category: 'ERP',
  description: 'When enabled, you will be able to interact with sex toys.',
  component: CheckboxInput,
};

export const breast_enlargement_pref: FeatureToggle = {
  name: 'Увеличение Груди',
  category: 'ERP',
  description:
    'Determines if you wish to receive the effects of breast enlargement chemicals.',
  component: CheckboxInput,
};

export const breast_shrinkage_pref: FeatureToggle = {
  name: 'Уменьшение Груди',
  category: 'ERP',
  description:
    'Determines if you wish to receive the effects of breast shrinkage chemicals.',
  component: CheckboxInput,
};

export const breast_removal_pref: FeatureToggle = {
  name: 'Полное Уменьшение Груди',
  category: 'ERP',
  description:
    'Determines if you wish to receive the full effects of breast shrinkage chemicals.',
  component: CheckboxInput,
};

export const penis_enlargement_pref: FeatureToggle = {
  name: 'Увеличение Полового Члена',
  category: 'ERP',
  description:
    'Determines if you wish to receive the effects of penis enlargement chemicals.',
  component: CheckboxInput,
};

export const penis_shrinkage_pref: FeatureToggle = {
  name: 'Уменьшение Полового Члена',
  category: 'ERP',
  description:
    'Determines if you wish to receive the effects of penis shrinkage chemicals.',
  component: CheckboxInput,
};

export const gender_change_pref: FeatureToggle = {
  name: 'Принудительное Изменение Пола',
  category: 'ERP',
  description: 'Determines if you wish to allow forced gender changing.',
  component: CheckboxInput,
};

export const autocum_pref: FeatureToggle = {
  name: 'Автоматический Оргазм',
  category: 'ERP',
  description:
    'Toggles whether you automatically cum using the arousal system, or if you need to do it manually.',
  component: CheckboxInput,
};

export const autoemote_pref: FeatureToggle = {
  name: 'Автоматические ЭРП-Реакции',
  category: 'ERP',
  description:
    'Toggles whether you automatically emote using the arousal system, or if you need to do it manually.',
  component: CheckboxInput,
};

export const erp_sexuality_pref: FeatureChoiced = {
  name: 'Сексуальные Предпочтения',
  category: 'ERP',
  description:
    'Определяет, какой сексуальный контент вы предпочитаете. "Нет" показывает все содержимое.',
  component: FeatureDropdownInput,
};

export const genitalia_removal_pref: FeatureToggle = {
  name: 'Удаление Половых Органов',
  category: 'ERP',
  description:
    'Если флажок установлен, позволяет наркотикам удалять существующие гениталии вашего персонажа.',
  component: CheckboxInput,
};

export const new_genitalia_growth_pref: FeatureToggle = {
  name: 'Наращивание Половых Органов',
  category: 'ERP',
  description:
    'Если флажок установлен, позволяет наркотикам вырастить новые гениталии на вашем персонаже.',
  component: CheckboxInput,
};

export const trash_forcefeed: FeatureToggle = {
  name: 'Принудительное Скармливание Мусора',
  category: 'ERP',
  description: 'Если включено, то вас можно кормить мусором.',
  component: CheckboxInput,
};

export const auto_wag: FeatureToggle = {
  name: 'Автоматическое Виляние Хвостом',
  category: 'ERP',
  description:
    'Если включено, то ваш хвост автоматически будет вилять, когда вас гладят.',
  component: CheckboxInput,
};

export const belly_enlargement: FeatureToggle = {
  name: 'Живот: Увеличение',
  category: 'ERP',
  description:
    'Если включено, то ваш живот будет становиться больше каким бы то ни было образом.',
  component: CheckboxInput,
};

export const belly_shrinkage: FeatureToggle = {
  name: 'Живот: Уменьшение',
  category: 'ERP',
  description:
    'Если включено, то ваш живот будет становиться больше каким бы то ни было образом.',
  component: CheckboxInput,
};

export const butt_enlargement: FeatureToggle = {
  name: 'Задница: Увеличение',
  category: 'ERP',
  description:
    'Если включено, то ваша задница будет становиться больше каким бы то ни было образом.',
  component: CheckboxInput,
};

export const butt_shrinkage: FeatureToggle = {
  name: 'Задница: Уменьшение',
  category: 'ERP',
  description:
    'Если включено, то ваша задница будет становиться больше каким бы то ни было образом.',
  component: CheckboxInput,
};

export const ass_slap: FeatureToggle = {
  name: 'Разрешение Шлепать По Заднице',
  category: 'ERP',
  description: 'Если включено, то вас можно будет шлёпать по задние',
  component: CheckboxInput,
};

export const unholy_pref: FeatureChoiced = {
  name: 'Особые ERP возможности',
  category: 'ERP',
  description: 'Если включено, то вас можно будет обоссать, ворить и кусать',
  component: FeatureDropdownInput,
};

export const nonconpref: FeatureChoiced = {
  name: 'Изнасилование',
  category: 'ERP',
  description: 'Если включено, то вас можно насиловать',
  component: FeatureDropdownInput,
};

export const extreme_pref: FeatureChoiced = {
  name: 'Экстремальный Контент',
  category: 'ERP',
  description: 'Если включено, то вас можно экстремально поиметь',
  component: FeatureDropdownInput,
};
