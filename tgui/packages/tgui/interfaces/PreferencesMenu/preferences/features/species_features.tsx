import { FeatureColorInput, Feature, FeatureChoiced, FeatureDropdownInput, FeatureValueProps, FeatureChoicedServerData } from './base';

export const eye_color: Feature<string> = {
  name: 'Цвет Глаз',
  component: FeatureColorInput,
};

export const facial_hair_color: Feature<string> = {
  name: 'Растительность. Лицевая. Цвет',
  component: FeatureColorInput,
};

export const facial_hair_gradient: FeatureChoiced = {
  name: 'Растительность. Лицевая. Градиент',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const facial_hair_gradient_color: Feature<string> = {
  name: 'Растительность. Лицевая. Цвет Градиента',
  component: FeatureColorInput,
};

export const hair_color: Feature<string> = {
  name: 'Растительность. Цвет',
  component: FeatureColorInput,
};

export const hair_gradient: FeatureChoiced = {
  name: 'Растительность. Градиент',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const hair_gradient_color: Feature<string> = {
  name: 'Растительность. Цвет Градиента',
  component: FeatureColorInput,
};

export const feature_human_ears: FeatureChoiced = {
  name: 'Уши',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_human_tail: FeatureChoiced = {
  name: 'Хвост',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_legs: FeatureChoiced = {
  name: 'Ноги',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_spines: FeatureChoiced = {
  name: 'Крутой Позвоночник',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_tail: FeatureChoiced = {
  name: 'Хвост',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_mcolor: Feature<string> = {
  name: 'Первичный Цвет Тела',
  component: FeatureColorInput,
};

export const underwear_color: Feature<string> = {
  name: 'Цвет Нижнего Белья',
  component: FeatureColorInput,
};

export const feature_vampire_status: Feature<string> = {
  name: 'Вампирский Статус',
  component: FeatureDropdownInput,
};

export const heterochromatic: Feature<string> = {
  name: 'Глаза - Гетерохромия (Правый Глаз)',
  component: FeatureColorInput,
};
