import { FeatureToggle, CheckboxInput } from '../../base';

export const ticket_ping_pref: FeatureToggle = {
  name: 'Пинг от Тикетского',
  category: 'ADMIN',
  description:
    'When enabled, you will recieve regular pings from unhandled tickets.',
  component: CheckboxInput,
};
