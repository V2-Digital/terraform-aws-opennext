import { use } from "react";

const fakeFetchSlowData = async () => {
  const data = await fetch("https://jsonplaceholder.typicode.com/todos/1", {
    cache: "no-store",
  }).then((response) => response.json());

  await new Promise((resolve) => setTimeout(resolve, 3000));
  return data;
};

export default function SlowData() {
  const data = use(fakeFetchSlowData());
  return (
    <pre>
      <code>{JSON.stringify(data, null, 2)}</code>
    </pre>
  );
}
