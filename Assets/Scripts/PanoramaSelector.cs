using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PanoramaSelector : MonoBehaviour
{
    [SerializeField] private List<GameObject> panoramas;
    private GameObject currentPanorama;

    private void Start()
    {
        if (panoramas.Count > 0)
        {
            // Desactivar todos los panoramas
            foreach (GameObject panorama in panoramas)
            {
                panorama.SetActive(false);
            }

            // Activar el panorama en el índice 0
            panoramas[0].SetActive(true);
            currentPanorama = panoramas[0];
        }
    }

    public void ActivatePanorama(int index)
    {
        if (index < 0 || index >= panoramas.Count)
        {
            Debug.LogError("Index out of range");
            return;
        }

        if (currentPanorama != null)
        {
            Vector3 position = currentPanorama.transform.position;
            Quaternion rotation = currentPanorama.transform.rotation;

            currentPanorama.SetActive(false);

            panoramas[index].transform.position = position;
            panoramas[index].transform.rotation = rotation;
        }

        panoramas[index].SetActive(true);
        currentPanorama = panoramas[index];
    }
}