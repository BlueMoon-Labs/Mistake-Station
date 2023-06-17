import { CheckboxInput, FeatureToggle } from '../base';

export const sound_ambience: FeatureToggle = {
  name: 'Включить Окружающие Звуки',
  category: 'SOUND',
  component: CheckboxInput,
};

export const sound_announcements: FeatureToggle = {
  name: 'Включить Звуки от Объявлений',
  category: 'SOUND',
  description: 'When enabled, hear sounds for command reports, notices, etc.',
  component: CheckboxInput,
};

export const sound_combatmode: FeatureToggle = {
  name: 'Включить Звуки от Комбат-Режима',
  category: 'SOUND',
  description: 'When enabled, hear sounds when toggling combat mode.',
  component: CheckboxInput,
};

export const sound_endofround: FeatureToggle = {
  name: 'Включить Музыку в Конце Раунда',
  category: 'SOUND',
  description: 'When enabled, hear a sound when the server is rebooting.',
  component: CheckboxInput,
};

export const sound_instruments: FeatureToggle = {
  name: 'Включить Звуки Инструментов',
  category: 'SOUND',
  description: 'When enabled, be able hear instruments in game.',
  component: CheckboxInput,
};

export const sound_jukebox: FeatureToggle = {
  name: 'Включить Жукбокс',
  category: 'SOUND',
  description: 'When enabled, hear music for jukeboxes, dance machines, etc.',
  component: CheckboxInput,
};

export const sound_lobby: FeatureToggle = {
  name: 'Включить Музыку в Лобби',
  category: 'SOUND',
  component: CheckboxInput,
};

export const sound_midi: FeatureToggle = {
  name: 'Включить MIDI-Музыку',
  category: 'SOUND',
  description: 'When enabled, admins will be able to play music to you.',
  component: CheckboxInput,
};

export const sound_ship_ambience: FeatureToggle = {
  name: 'Включить Корабельные Звуки',
  category: 'SOUND',
  component: CheckboxInput,
};

export const weird_sounds: FeatureToggle = {
  name: 'Включить Ужасные Звуки',
  category: 'SOUND',
  component: CheckboxInput,
};

export const sound_elevator: FeatureToggle = {
  name: 'Enable elevator music',
  category: 'SOUND',
  component: CheckboxInput,
};

export const sound_elevator: FeatureToggle = {
  name: 'Enable elevator music',
  category: 'SOUND',
  component: CheckboxInput,
};
