import { CheckboxInput, FeatureToggle } from '../base';

export const sound_ambience: FeatureToggle = {
  name: 'Enable Ambience',
  category: 'SOUND',
  component: CheckboxInput,
};

export const sound_announcements: FeatureToggle = {
  name: 'Enable Announcement Sounds',
  category: 'SOUND',
  description: 'When enabled, hear sounds for command reports, notices, etc.',
  component: CheckboxInput,
};

export const sound_combatmode: FeatureToggle = {
  name: 'Enable Combat Mode Sound',
  category: 'SOUND',
  description: 'When enabled, hear sounds when toggling combat mode.',
  component: CheckboxInput,
};

export const sound_endofround: FeatureToggle = {
  name: 'Enable End of Round Sounds',
  category: 'SOUND',
  description: 'When enabled, hear a sound when the server is rebooting.',
  component: CheckboxInput,
};

export const sound_instruments: FeatureToggle = {
  name: 'Enable Instruments',
  category: 'SOUND',
  description: 'When enabled, be able hear instruments in game.',
  component: CheckboxInput,
};

export const sound_jukebox: FeatureToggle = {
  name: 'Enable Jukebox Music',
  category: 'SOUND',
  description: 'When enabled, hear music for jukeboxes, dance machines, etc.',
  component: CheckboxInput,
};

export const sound_lobby: FeatureToggle = {
  name: 'Enable Lobby Music',
  category: 'SOUND',
  component: CheckboxInput,
};

export const sound_midi: FeatureToggle = {
  name: 'Enable Admin Music',
  category: 'SOUND',
  description: 'When enabled, admins will be able to play music to you.',
  component: CheckboxInput,
};

export const sound_ship_ambience: FeatureToggle = {
  name: 'Enable Ship Ambience',
  category: 'SOUND',
  component: CheckboxInput,
};

export const weird_sounds: FeatureToggle = {
  name: 'Enable Wierd Sounds',
  category: 'SOUND',
  component: CheckboxInput,
};
